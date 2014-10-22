//
//  User.swift
//  realm-dynamic-cast-error
//
//  Created by Javier Julio on 10/17/14.
//  Copyright (c) 2014 Javier Julio. All rights reserved.
//

import Foundation
import Realm

class User: RLMObject {
  
  dynamic var firstName: String = ""
  dynamic var lastName: String = ""
  
}
