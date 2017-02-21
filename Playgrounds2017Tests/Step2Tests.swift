//
//  Step2Tests.swift
//  Playgrounds2017
//
//  Created by Matt Gallagher on 2017/02/21.
//  Copyright © 2017 Matt Gallagher ( http://cocoawithlove.com ). All rights reserved.
//

import Foundation
import XCTest

private let randomIterations = 100_000_000

class Step2Tests: XCTestCase {
	
	func testNoArrayIndexes() {
		var generator = NoArrayIndexesMersenneTwister()

		measure { () -> Void in
			var sum: UInt64 = 0
			for _ in 0..<randomIterations {
				sum = sum &+ generator.random64()
			}
			XCTAssert(sum != 0)
		}
	}
	
	func testNoArrays() {
		var generator = NoArraysMersenneTwister()

		measure { () -> Void in
			var sum: UInt64 = 0
			for _ in 0..<randomIterations {
				sum = sum &+ generator.random64()
			}
			XCTAssert(sum != 0)
		}
	}
	
}
