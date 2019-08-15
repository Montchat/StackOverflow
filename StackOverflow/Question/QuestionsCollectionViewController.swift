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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		collectionView.register(QuestionCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
		
	}
}

//MARK: Collection View Delegate
extension QuestionsCollectionViewController {
	
}


//MARK: Collection View Data Source
extension QuestionsCollectionViewController {
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: QuestionCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! QuestionCollectionViewCell
		return cell
	}
	
}
