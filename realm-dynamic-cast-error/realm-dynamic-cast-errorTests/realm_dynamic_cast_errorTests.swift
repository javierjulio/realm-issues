//
//  realm_dynamic_cast_errorTests.swift
//  realm-dynamic-cast-errorTests
//
//  Created by Javier Julio on 10/17/14.
//  Copyright (c) 2014 Javier Julio. All rights reserved.
//

import UIKit
import XCTest

class realm_dynamic_cast_errorTests: BaseTestCase {
  
  // First time I ran this test it only included this function. It passed.
  // But then afterwards it failed. After several times running it eventually 
  // passed again. Something isn't right.
  func testSomething() {
    let realm = realmWithTestPath()
    let userService = UserService(realm: realm)
    
    XCTAssertEqual(User.allObjects().count, 0)
    
    // if the swift_dynamicCastClassUnconditional error does occur its always at this point
    let user = userService.defaultUser()
    
    XCTAssertNotNil(user)
    XCTAssertEqual(User.allObjects().count, 1)
    
    userService.defaultUser()
    
    XCTAssertEqual(User.allObjects().count, 1)
  }
  
  func testSomething2() {
    let realm = realmWithTestPath()
    let userService = UserService(realm: realm)
    let user = userService.defaultUser()
    
    XCTAssertNotNil(user)
  }
  
  func testWorking() {
    let realm = realmWithTestPath()
    let userService = UserService(realm: realm)
    
    XCTAssertEqual(User.allObjects().count, 0)
    
    let user = userService.defaultUserWORKING()
    
    XCTAssertNotNil(user)
    XCTAssertEqual(User.allObjects().count, 1)
    
    userService.defaultUserWORKING()
    
    XCTAssertEqual(User.allObjects().count, 1)
  }
  
}
