//
//  Question.swift
//  StackOverflow
//
//  Created by Joe Edwards IV on 8/15/19.
//  Copyright © 2019 Joe Edwards IV. All rights reserved.
//

import UIKit

struct Questions: Codable {
	
	let hasMore: Bool
	var questions: [Question]
	
}

struct Question: Codable {
	
	let answerCount: Int?
	let creationDate: Int?
	let lastActivityDate: Int?
	let isAnswered: Bool?
	let title: String?
	let url: String?
	
	
	var titleText: String {
		let attributedString = title?.html2AttributedString ?? NSAttributedString(string: "")
		return attributedString.string
		
	}
	
	var answerCountText: String {
		let result: String
		
		guard let answerCount = answerCount else {
			result = "This question has not been answered."
			return result
		}
		
		if answerCount == 0 {
			result = "This question has not been answered."
		} else if answerCount == 1 {
			result = "This question has been answered once."
		} else {
			result = "This question has been answered \(answerCount) times."
		}
		
		return result
	}
	
	var timeStampText: String {
		let result: String
		result = "answered five minutes ago"
		return result
		
	}
	
}

fileprivate extension Questions {
	
	enum CodingKeys: String, CodingKey {
		case hasMore = "has_more"
		case questions = "items"
	}
	
}

fileprivate extension Question {
	
	enum CodingKeys: String, CodingKey {
		case answerCount = "answer_count"
		case creationDate = "creation_date"
		case isAnswered = "is_answered"
		case lastActivityDate = "last_activity_date"
		case title
		case url = "link"
	}
	
}

extension Data {
	var html2AttributedString: NSAttributedString? {
		do {
			return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
		} catch {
			print("error:", error)
			return  nil
		}
	}
	var html2String: String {
		return html2AttributedString?.string ?? ""
	}
}

extension String {
	var html2AttributedString: NSAttributedString? {
		return Data(utf8).html2AttributedString
	}
	var html2String: String {
		return html2AttributedString?.string ?? ""
	}
}

