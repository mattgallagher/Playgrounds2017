//
//  InvocationTests.swift
//  Playgrounds2017
//
//  Created by Matt Gallagher on 2017/02/08.
//  Copyright © 2017 Matt Gallagher ( http://cocoawithlove.com ). All rights reserved.
//

import XCTest
import Playgrounds2017

let invocationIterations = 1_000_000

class InvocationTests: XCTestCase {
	
	func testBasicInvocation() {
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				emptyFunction()
			}
		}
	}

	func testParamInvocation() {
		let r = Result<Int>.success(0)
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				one(param: r)
			}
		}
	}

	func testGenericInvocation() {
		let r = Result<Int>.success(0)
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				generic(param: r)
			}
		}
	}

	func testGenericEnumInvocation() {
		let r = Result<Int>.success(0)
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				generic(result: r)
			}
		}
	}

	func testGenericEnumResultInvocation() {
		var r = Result<Int>.success(0)
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				generic(result: &r)
			}
		}
	}

	func testLargeGenericEnumResultInvocation() {
		var r = Result<(Int, Int, Int)>.success((0, 1, 2) as (Int, Int, Int))
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				generic(result: &r)
			}
		}
	}

	func testParamCopyingInvocation() {
		let r = 0
		var a = [r]
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				paramCopyingFunction(array: &a, value: r)
			}
		}
	}

	func testGenericCopyingInvocation() {
		let r = 0
		var a = [r]
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				genericCopyingFunction(array: &a, value: r)
			}
		}
	}

	func testGenericCopyingMethod() {
		let r = 0
		let object = GenericClass(value: r)
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				object.copy(value: r)
			}
		}
	}

	func testPassReference() {
		let bc = BasicClass()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				passReference(param: bc)
			}
		}
	}

	func testPassGenericReference() {
		let bc = BasicClass()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				passGenericReference(param: bc)
			}
		}
	}

	func testPassInoutGenericReference() {
		var bc = BasicClass()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				passGenericReference(param: &bc)
			}
		}
	}

	func testPassObjcReference() {
		let bc = ObjcSubclass()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				passObjcReference(param: bc)
			}
		}
	}

	func testPassReferenceInout() {
		var bc = BasicClass()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				passReferenceInout(param: &bc)
			}
		}
	}

	func testFinalMethod() {
		let bc = ObjcSubclass()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				bc.finalMethod()
			}
		}
	}

	func testNonFinalMethod() {
		let bc = ObjcSubclass()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				bc.nonFinalMethod()
			}
		}
	}

	func testDynamicMethod() {
		let bc = ObjcSubclass()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				bc.dynamicMethod()
			}
		}
	}

	func testObjcMethod() {
		let bc = ObjcSubclass()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				bc.objcMethod()
			}
		}
	}

	func testExistential() {
		let ef = genEmptyFunction()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				ef.emptyFunction()
			}
		}
	}

	func testExistentialClass() {
		let ef = genCancellableEmptyFunction()
		measure { () -> Void in
			for _ in 0..<invocationIterations {
				ef.emptyFunction()
			}
		}
	}
}
