//
//  CaptureTests.swift
//  Playgrounds2017
//
//  Created by Matt Gallagher on 2017/02/08.
//  Copyright © 2017 Matt Gallagher ( http://cocoawithlove.com ). All rights reserved.
//

import XCTest
import Playgrounds2017

let captureIterations = 1_000_000

class CaptureTests: XCTestCase {
	func testParameter() {
		measure { () -> Void in
			for i in 0..<invocationIterations {
				parameter(value: i)
			}
		}
	}

	func testConstantClosure() {
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				trailingClosure { 0 }
			}
		}
	}

	func testCapturingClosure() {
		measure { () -> Void in
			for i in 0..<invocationIterations {
				trailingClosure {	i }
			}
		}
	}
}
