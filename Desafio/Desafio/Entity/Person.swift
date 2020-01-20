//
//  Person.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Person {
    var ref:DatabaseReference?
    let name: String?
    let lastName: String?
    let birthday: String?
    let age: String?
    
    init(name: String, lastName:String, age: String, birthday:String) {
        self.ref = nil
        self.name = name
        self.lastName = lastName
        self.age = age
        self.birthday = birthday
    }
    
    func fullName() -> String {
        return name! + " " + lastName!
    }
    
    init?(snapshot: DataSnapshot){
        guard
            let value = snapshot.value as? [String:AnyObject],
            let name = value["name"] as? String,
            let lastName = value["lastName"] as? String,
            let age = value["age"] as? String,
            let birthday = value["birthday"] as? String
            else {
                return nil
        }
        self.ref = snapshot.ref
        self.name = name
        self.lastName = lastName
        self.age = age
        self.birthday = birthday
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "lastName":lastName,
            "age":age,
            "birthday":birthday
        ]
    }
}
