//
//  Person.swift
//  RealmCrashSample
//
//  Created by sakamoto kazuhiro on 2016/03/09.
//  Copyright © 2016年 Sakamoto Kazuhiro. All rights reserved.
//
class Person: RLMObject{
    dynamic var name = ""
    var myPet:Animal?
    
    override static func ignoredProperties() -> [String]? {
        return ["myPet"]
    }
}

protocol Animal {
}

class Dog:Animal {
}