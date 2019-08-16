//
//  ViewController.swift
//  StackOverflow
//
//  Created by Joe Edwards IV on 8/15/19.
//  Copyright © 2019 Joe Edwards IV. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class QuestionsCollectionViewController: UICollectionViewController {
	
	var model: QuestionsModel!
	var layout: CollectionViewLayoutModel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		model = QuestionsModel(questions: [], downloadTask: nil)
		
		layout = CollectionViewLayoutModel(view: collectionView, sectionInsets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8), itemsPerRow: 1, minimumLineSpacing: 16)
		
		collectionView.register(QuestionCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
		configure(withModel: model)
		
	}
}

//MARK: Configure method
extension QuestionsCollectionViewController {
	
	internal func configure(withModel model: QuestionsModel) {
		title = model.title
		self.model = model
		
		if model.questions.isEmpty {
			questionURLRequest(withModel: model)
		}
		
		collectionView.reloadData()
		
	}
	
}

//MARK: Collection View Delegate
extension QuestionsCollectionViewController {
	
	override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("tapped")
	}
	
}


//MARK: Collection View Data Source
extension QuestionsCollectionViewController {
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return model.questions.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: QuestionCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! QuestionCollectionViewCell
		cell.configure(withQuestion: model.questions[indexPath.row])
		return cell
	}
	
}

//MARK: Delegate Flow Layout
extension QuestionsCollectionViewController: UICollectionViewDelegateFlowLayout {
	
	internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return layout.sectionInsets
	}
	
	internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let questionText = model.questions[indexPath.row].title ?? ""
		
		let rect: CGSize
		
		let attributedString: NSAttributedString
		attributedString = NSAttributedString(string: questionText, attributes: [NSAttributedString.Key.font: UIFont.question])
		
		let rectangle: CGRect = attributedString.boundingRect(with: CGSize(width: collectionView.bounds.size.width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
		
		rect = CGSize(width: layout.size.width, height: rectangle.size.height + 75)
		
		return rect
	}
	
}

//MARK URLRequest
extension QuestionsCollectionViewController {
	
	fileprivate func questionURLRequest(withModel model: QuestionsModel) {
		var model = model
		
		if model.downloadTask?.progress.isCancellable ?? false {
			model.downloadTask?.cancel()
		}
		
		let url = model.server.components.url!
		
		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			
			guard error == nil else {
				print("Error: \(error!.localizedDescription)")
				return
			}
			
			guard let data = data else {
				print("Error: \(error!.localizedDescription)")
				return
			}
			
			do {
				let json = try? JSONSerialization.jsonObject(with: data, options: [])
				print("json", json)
				
				let decoder = JSONDecoder()
				let decodedData = try decoder.decode(Questions.self, from: data)
				model.questions = decodedData.questions
				
			} catch {
				print("Error: \(error.localizedDescription)")
				return
			}
			
			DispatchQueue.main.async {
				self.configure(withModel: model)
			}
		}
		
		task.resume()
		model.downloadTask = task
		
	}
	
}


extension UIFont {
	
	static var question: UIFont { return UIFont.systemFont(ofSize: 15) }
	
}
