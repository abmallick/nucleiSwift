//
//  main.swift
//  Assignment2
//
//  Created by Abhinav Kumar on 14/01/20.
//  Copyright © 2020 Nuclei. All rights reserved.
//

import Foundation
//add, display, delete, save, exit
//name, age, address, rollNo, course
var choice : Int?
var name : String?
var age : Int?
var address : String?
var rollNo : String?
var course = [String]()

var users = [Student]()

while(true) {
    print("1. Add User\t 2. Display User Details\t 3. Delete User Details\t 4. Save User Details, 5. Exit")
    
    if let temp = readLine(){
        choice = Int(temp)
    }
    
    switch choice {
    case 1:
        while name == nil {
            print("Enter name")
            if let temp = readLine() {
                name = temp
            }
        }
        
        while age == nil {
            print("Enter age")
            if let temp = readLine(){
                age = Int(temp)
            }
        }
        
        while address == nil {
            print("Enter address")
            if let temp = readLine() {
                address = temp
            }
        }
        
        while rollNo == nil {
            print("Enter rollNo")
            if let temp = readLine() {
                rollNo = temp
            }
        }
        
        print("Enter Courses, 4 out of 6: A, B, C, D, E, F");
        for i in 0..<4 {
            print("Enter course \(i+1)");
            if let temp = readLine() {
                course.insert(temp, at: i)
            }
            while("A" != (course[i]) && "B" != (course[i]) && "C" != (course[i]) && "D" != (course[i]) && "E" != (course[i]) && "F" != (course[i])) {
                print("Enter valid course!");
                course.remove(at: i)
                if let temp = readLine() {
                    course.insert(temp, at: i)
                }
            }
        }
        
        users.append(Student(name: name!, age: age!, address: address!, rollNo: rollNo!, course: course))
        
        users.sort(by: {(s1 : Student , s2 : Student) in
            if s1.getName() == s2.getName() {
                return s1.getRollNo() > s2.getRollNo()
            }
            else {
                return s1.getName() > s2.getName()}
            })
        break
    case 2:
        if users.count == 0 {
            print("No records exist!")
            break
        }
        print("Users ")
        
        for user in users {
            print(user)
        }
        var sort : Int = -1
        print("1. Sort by name\t 2. Sort by rollNo\t 3. Sort by age\t 4. Sort by address")
        if let temp = Int(readLine()!){
            sort = temp
        }
        switch sort {
        case 1:
            let sortedByName = users.sorted(by: {(s1 : Student, s2 : Student) in s1.getName() > s2.getName()})
            print("Sorted by Name: ")
            
            for user in sortedByName {
                print(user)
            }
        
        case 2:
            let sortedByRoll = users.sorted(by: {(s1 : Student, s2 : Student) in s1.getRollNo() > s2.getRollNo()})
            
            for user in sortedByRoll {
                print(user)
            }
            
        case 3:
            let sortedByAge = users.sorted(by: {(s1 : Student, s2 : Student) in s1.getAge() > s2.getAge()})
            
            for user in sortedByAge {
                print(user)
            }
            
        case 4:
            let sortedByAddress = users.sorted(by: {(s1 : Student, s2 : Student) in s1.getAddress() > s2.getAddress()})
            
            for user in sortedByAddress {
                print(user)
            }
        default: print("Invalid sorting option")
        }
        break
        
    case 3:
        if users.count == 0 {
            print("No records exist!")
            break
        }
        print("Enter rollNo to delete user")
        
        if let temp = readLine(){
            rollNo = temp
        }
        let temp = users
        
        users = users.filter({ $0.getRollNo() != rollNo})
        
        if temp == users {
            print("No such rollNo exists!")
        }
        else {
            print("Removed successfully")
        }
        break
        
    case 4:
        print("Option currently unavailable")
    case 5:
        exit(0)
    default:
        print("Enter valid option")
    }
}
