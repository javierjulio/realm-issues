//
//  UserService.swift
//  realm-dynamic-cast-error
//
//  Created by Javier Julio on 10/17/14.
//  Copyright (c) 2014 Javier Julio. All rights reserved.
//

import Foundation
import Realm

class UserService {
  
  var realm: RLMRealm
  
  init(realm: RLMRealm) {
    self.realm = realm
  }
  
  func defaultUser() -> User {
    if User.allObjectsInRealm(realm).count == 0 {
      realm.transactionWithBlock() {
        let user = User()
        user.firstName = "Javier"
        user.lastName = "Julio"
        self.realm.addObject(user)
      }
    }
    
    return User.allObjects().firstObject() as User
  }
  
  func defaultUserWORKING() -> User {
    if User.allObjectsInRealm(realm).count == 0 {
      let user = User()
      realm.transactionWithBlock() {
        user.firstName = "Javier"
        user.lastName = "Julio"
        self.realm.addObject(user)
      }
      return user
    }
    else {
      return User.allObjectsInRealm(realm).firstObject() as User
    }
  }
  
}
