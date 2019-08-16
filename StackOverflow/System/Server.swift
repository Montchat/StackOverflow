//
//  Server.swift
//  StackOverflow
//
//  Created by Joe Edwards IV on 8/15/19.
//  Copyright © 2019 Joe Edwards IV. All rights reserved.
//

import Foundation

struct Server {
	
	let host: URL
	
	let appKey: String = "tMUPxsnkyL2ZT58jWOWUag(("
	let clientID: Int = 16001
	
	fileprivate var keyItem: URLQueryItem {
		return URLQueryItem(name: "key", value: appKey)
		
	}
	
	fileprivate var stackoverflow: URLQueryItem {
		return URLQueryItem(name: "site", value: "stackoverflow")
		
	}
	
}

extension Server {
	
	var components: URLComponents {
		var result: URLComponents = URLComponents(url: questions, resolvingAgainstBaseURL: false)!
		result.queryItems = queryItems
		return result
		
	}
	
	var queryItems: [URLQueryItem] {
		return [stackoverflow, keyItem]
	}
	
	private var questions: URL {
		return host.appendingPathComponent("/questions/")
	}
	
	
}

enum Servers {
	static let production = Server(host: URL(string: "https://api.stackexchange.com/2.2")!)
	
}
