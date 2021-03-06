//
//  Step1Tests.swift
//  Playgrounds2017
//
//  Created by Matt Gallagher on 2017/02/21.
//  Copyright © 2017 Matt Gallagher ( http://cocoawithlove.com ). All rights reserved.
//

import Foundation
import XCTest

private let randomIterations = 100_000_000

class Step1Tests: XCTestCase {
	
	func testBaselineMT19937_64() {
		var generator = MT19937_64()

		measure { () -> Void in
			var sum: UInt64 = 0
			for _ in 0..<randomIterations {
				sum = sum &+ generator.random64()
			}
			XCTAssert(sum != 0)
		}
	}
	
	func testNaiveSwiftTranslation() {
		var generator = NaiveSwiftMersenneTwister()

		measure { () -> Void in
			var sum: UInt64 = 0
			for _ in 0..<randomIterations {
				sum = sum &+ generator.random64()
			}
			XCTAssert(sum != 0)
		}
	}
	
}

private struct MT19937_64: RandomWordGenerator {
	typealias WordType = UInt64
	var state = mt19937_64()

	init() {
		init_genrand64(&state, DevRandom.random64())
	}

	init(seed: UInt64) {
		init_genrand64(&state, seed)
	}

	mutating func random64() -> UInt64 {
		return genrand64_int64(&state)
	}

	mutating func randomWord() -> UInt64 {
		return genrand64_int64(&state)
	}
}
