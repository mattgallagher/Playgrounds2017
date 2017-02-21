//
//  MersenneTests.swift
//  Playgrounds2017Tests
//
//  Created by Matt Gallagher on 2017/02/07.
//  Copyright © 2017 Matt Gallagher ( http://cocoawithlove.com ). All rights reserved.
//

import XCTest
import Playgrounds2017

let randomIterations = 10_000_000

class MersenneTests: XCTestCase {
	
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
	
	func testMersenneTwister() {
		var generator = MersenneTwister()

		measure { () -> Void in
			var sum: UInt64 = 0
			for _ in 0..<randomIterations {
				sum = sum &+ generator.random64()
			}
			XCTAssert(sum != 0)
		}
	}
	
	func testImprovedMT19937_64() {
		var generator = MT19937_64_Improved()

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


private struct MT19937_64_Improved: RandomWordGenerator {
	typealias WordType = UInt64
	var state = mt19937_64()

	init() {
		init_genrand64(&state, DevRandom.random64())
	}

	init(seed: UInt64) {
		init_genrand64(&state, seed)
	}

	mutating func random64() -> UInt64 {
		return improved_genrand64_int64(&state)
	}

	mutating func randomWord() -> UInt64 {
		return improved_genrand64_int64(&state)
	}
}
