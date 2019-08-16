//
//  CollectionViewLayoutModel.swift
//  StackOverflow
//
//  Created by Joe Edwards IV on 8/15/19.
//  Copyright © 2019 Joe Edwards IV. All rights reserved.
//

import UIKit

struct CollectionViewLayoutModel {
	
	weak var view: UIView!
	
	let sectionInsets: UIEdgeInsets!
	let itemsPerRow: CGFloat!
	let minimumLineSpacing: CGFloat!
	
	var size: CGSize {
		
		let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
		let availableWidth = view.frame.width - paddingSpace
		let widthPerItem = availableWidth / itemsPerRow
		
		return CGSize(width: widthPerItem, height: widthPerItem)
		
	}
	
}
