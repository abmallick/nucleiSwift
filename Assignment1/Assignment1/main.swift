//
//  main.swift
//  Assignment1
//
//  Created by Abhinav Kumar on 08/01/20.
//  Copyright © 2020 Abhinav Mallick. All rights reserved.
//

//import Foundation

var sent = "y"
var name : String = ""
var price : Double = -1
var quantity : Int = -1
var type : String = ""

var list = [Item]()

while(sent == "y" || sent == "Y") {
    print("Enter Item name, price, quantity, type")
    if let tname = readLine() {
        name = tname
    }

    if let tprice = Double(readLine()!) {
        price = tprice
    }

    if let tquantity = Int(readLine()!) {
        quantity = tquantity
    }

    if let ttype = readLine() {
        type = ttype
    }
    
    while(!(type == "raw") && !(type == "manufactured") && !(type == "imported")) {
        print("Please enter valid item type \t raw, manufactured or imported");
        if let ttype = readLine() {
            type = ttype
        }
    }
    list.append(Item(name: name, price: price, quantity: quantity, type: type))
    
    print("Want to enter more items? y/Y")
    if let tsent = readLine(){
        sent = tsent
    }
}

for item in list {
    item.computeTax()
    print(item)
}
