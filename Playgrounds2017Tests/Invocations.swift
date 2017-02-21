//
//  Invocations.swift
//  Playgrounds2017
//
//  Created by Matt Gallagher on 2017/02/08.
//  Copyright © 2017 Matt Gallagher ( http://cocoawithlove.com ). All rights reserved.
//

import Playgrounds2017

protocol EmptyFunction {
	func emptyFunction()
}

class EmptyFunctionAndCancellable: EmptyFunction, Cancellable {
	func emptyFunction() {}
	func cancel() {}
}

func genEmptyFunction() -> EmptyFunction {
	return EmptyFunctionAndCancellable()
}

func genCancellableEmptyFunction() -> EmptyFunction & Cancellable {
	return EmptyFunctionAndCancellable()
}

func emptyFunction() {
}

func one(param: Result<Int>) {
}

func generic<T>(param: Result<T>) {
}

func generic<T>(param: inout Result<T>){
	switch param {
	case .success(let v): param = Result<T>.success(v)
	case .failure(let e): param = Result<T>.failure(e)
	}
}

func generic<T>(param: T) {
}

func paramCopyingFunction(array: inout Array<Int>, value: Int) {
	array[0] = value
}

func genericCopyingFunction<T>(array: inout Array<T>, value: T) {
	array[0] = value
}

open class BasicClass {
	init() {
	}
}

class GenericClass<T> {
	var array: [T]
	init(value: T) {
		array = [value]
	}
	final func copy(value: T) {
		array[0] = value
	}
}

open class ObjcSubclass: NSObject {
	var value: Int = 0
	override init() {
		super.init()
	}
	
	final func finalMethod() {
	}
	
	open func nonFinalMethod() {
		value = value &+ 1
	}
	
	dynamic func dynamicMethod() {
	}
	
	@objc dynamic func objcMethod() {
	}
}

open class Subclass: ObjcSubclass {
	open override func nonFinalMethod() {
		value = value &+ 2
	}
}

func passReference(param: BasicClass) {
}

func passObjcReference(param: ObjcSubclass) {
}

func passReferenceInout(param: inout BasicClass) {
}
