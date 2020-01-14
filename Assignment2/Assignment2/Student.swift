//
//  User.swift
//  Assignment2
//
//  Created by Abhinav Kumar on 14/01/20.
//  Copyright © 2020 Nuclei. All rights reserved.
//

import Foundation

class Student : CustomStringConvertible {
    //name, age, address, rollNo, course
    var name : String
    var age : Int
    var address : String
    var rollNo : String
    var course = [String]()
    
    init(name: String, age : Int, address : String, rollNo : String, course : [String]) {
        self.name = name
        self.age = age
        self.address = address
        self.rollNo = rollNo
        self.course = course
    }
    
    func getName() -> String {
        return name
    }
    
    func getAge() -> Int {
        return age
    }
    
    func getAddress() -> String {
        return address
    }
    
    func getRollNo() -> String {
        return rollNo
    }
    
    public var description : String {
       "name = \(name), age = \(age), address = \(address), rollNo = \(rollNo), course = \(course)"
    }
}
