//
//  ViewController.swift
//  StackOverflow
//
//  Created by Joe Edwards IV on 8/15/19.
//  Copyright © 2019 Joe Edwards IV. All rights reserved.
//

import UIKit

class QuestionCollectionViewController: UICollectionViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		print("view did load")
		
	}
}
