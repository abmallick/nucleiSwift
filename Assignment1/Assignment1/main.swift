//
//  main.swift
//  Assignment1
//
//  Created by Abhinav Kumar on 08/01/20.
//  Copyright © 2020 Abhinav Mallick. All rights reserved.
//

//import Foundation

var sent = "y"
var name : String?
var price : Double?
var quantity : Int?
var type : String?

var list = [Item]()

while(sent == "y" || sent == "Y") {
    while name == nil {
        print("Enter name")
        if let tname = readLine() {
            name = tname
        }
    }
    
    while price == nil {
        print("Enter price")
        if let tprice = readLine() {
            price = Double(tprice)
        }
    }
    
    while quantity == nil {
        print("Enter quantity")
        if let tquantity = readLine() {
            quantity = Int(tquantity)
        }
    }
    
    while type == nil {
        print("Enter type")
        if let ttype = readLine() {
            type = ttype
        }
    }
    
    while(!(type == "raw") && !(type == "manufactured") && !(type == "imported")) {
        print("Please enter valid item type \t raw, manufactured or imported");
        if let ttype = readLine() {
            type = ttype
        }
    }
    
    list.append(Item(name: name!, price: price!, quantity: quantity!, type: type!))
    
    print("Want to enter more items? y/Y")
    if let tsent = readLine(){
        sent = tsent
    }
}

for item in list {
    item.computeTax()
    print(item)
}
