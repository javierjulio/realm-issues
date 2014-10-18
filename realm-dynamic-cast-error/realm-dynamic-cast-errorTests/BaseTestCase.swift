//
//  BaseTestCase.swift
//  realm-dynamic-cast-error
//
//  Created by Javier Julio on 10/17/14.
//  Copyright (c) 2014 Javier Julio. All rights reserved.
//

import UIKit
import XCTest
import Realm

func testRealmPath() -> String {
  return realmPathForFile("test.realm")
}

func realmPathForFile(fileName: String) -> String {
  let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
  return (paths[0] as String).stringByAppendingPathComponent(fileName)
}

func realmLockPath(path: String) -> String {
  return path + ".lock"
}

func deleteRealmFilesAtPath(path: String) {
  var error: NSError?
  var fileManager = NSFileManager.defaultManager()
  
  if fileManager.fileExistsAtPath(path) {
    NSFileManager.defaultManager().removeItemAtPath(path, error: &error)
    assert(error == nil, "Unable to delete realm: \(path)")
  }
  
  if fileManager.fileExistsAtPath(path) {
    NSFileManager.defaultManager().removeItemAtPath(realmLockPath(path), error: &error)
    assert(error == nil, "Unable to delete realm: \(path)")
  }
}

extension RLMRealm {
  class func defaultRealm() -> RLMRealm! {
    return RLMRealm.realmWithPath(testRealmPath(), readOnly: false, error: nil)
  }
}

class BaseTestCase: XCTestCase {
  
  func realmWithTestPath() -> RLMRealm! {
    return RLMRealm.realmWithPath(testRealmPath(), readOnly: false, error: nil)
  }
  
  override func setUp() {
    super.setUp()
    
    // Delete realm files
    deleteRealmFilesAtPath(testRealmPath())
  }
  
  override func tearDown() {
    super.tearDown()
    
    // Reset Realm cache
    RLMRealm.clearRealmCache()
    
    // Delete realm files
    deleteRealmFilesAtPath(testRealmPath())
  }
  
}
