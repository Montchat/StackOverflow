//
//  QuestionCollectionViewCell.swift
//  StackOverflow
//
//  Created by Joe Edwards IV on 8/15/19.
//  Copyright © 2019 Joe Edwards IV. All rights reserved.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet var childView: UIView!
	@IBOutlet weak var question: UILabel!
	@IBOutlet weak var answer: UILabel!
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		configure()
		
	}
	
	private func configure() {
		//load the nib
	Bundle.main.loadNibNamed("QuestionCollectionViewCell", owner: self, options: nil)
		
		addSubview(contentView)
		childView.frame = contentView.frame
		contentView.addSubview(childView)
		contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		childView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		layoutIfNeeded()
		
		//Small UI Updates
		contentView.layer.borderColor = UIColor.gray.cgColor
		contentView.layer.masksToBounds = false
		contentView.layer.cornerRadius = 3
		contentView.layer.borderWidth = 0.33
		contentView.layer.shadowColor = UIColor.black.cgColor
		
	}
	
}
