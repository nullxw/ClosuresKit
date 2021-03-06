//
//  SequenceExtensionTests.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/22.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import XCTest
@testable import ClosuresKit

class SequenceExtensionTests: XCTestCase {
    
    let testSequence = [2,5,6,9]
    
    func testMatch() {
        let result = testSequence.cs_match { (value) -> Bool in
            return value == 5
        }
        assert(result==5,"match failed")
    }
    
    func testAny() {
        let result = testSequence.cs_any { (value) -> Bool in
            return value > 10
        }
        assert(result == false, "any failed")
    }
    
    func testNone() {
        let result = testSequence.cs_none { (value) -> Bool in
            return value > 10
        }
        assert(result, "none failed")
    }
    
    func testAll() {
        var result = testSequence.cs_all { (value) -> Bool in
            return value > 10
        }
        assert(result == false, "all failed")
        
        result = testSequence.cs_all({$0 > 0})
        assert(result, "all failed")
    }
}
