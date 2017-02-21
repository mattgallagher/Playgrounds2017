//
//  Step3Tests.swift
//  Playgrounds2017
//
//  Created by Matt Gallagher on 2017/02/21.
//  Copyright © 2017 Matt Gallagher ( http://cocoawithlove.com ). All rights reserved.
//

import XCTest
import Playgrounds2017

private let randomIterations = 1_000_000

class Step4Tests: XCTestCase {
	
	func testInvocationTypes() {
		var r = Result<Int>.success(0)
		var r2 = Result<(Int, Int, Int)>.success((0, 0, 0) as (Int, Int, Int))
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				one(param: r)
				generic(param: r)
				generic(result: r)
				generic(result: &r)
				generic(result: &r2)
			}
		}
	}
	
}
