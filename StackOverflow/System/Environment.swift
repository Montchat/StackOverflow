//
//  Environment.swift
//  StackOverflow
//
//  Created by Joe Edwards IV on 8/15/19.
//  Copyright © 2019 Joe Edwards IV. All rights reserved.
//

import Foundation

struct Environment {
	
	static var shared: Environment = Environment()
	
	var server: Server {
		return Servers.production
	}
	
}
