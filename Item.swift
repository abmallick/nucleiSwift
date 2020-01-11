//
//  Item.swift
//  
//
//  Created by Abhinav Kumar on 08/01/20.
//

import Foundation

public class Item {
    var name : String
    var price : Double
    var quantity : Int
    var type : String
    var tax : Double
    var total : Double
    
    init(name : String, price : Double, quantity : Int, type : String) {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.type = type
    }
    
    func computeTax() -> Double {
        var cost = price*quantity
        
        if type == "raw" {
            tax = cost * 0.125
            total = tax + cost
        }
        else if type == "manufactured" {
            tax = cost * 0.125;
            tax = tax + (tax + cost) * 0.02
            total = tax+cost
        }
        else if type == "imported" {
            tax = cost*0.10;
            total = tax + cost;
            if total <= 100.0 {
                tax += 5;
            }
            else if total <= 200 {
                tax += 10;
            }
            else {
                tax += total*0.05;
            }
            total = tax + cost;
        }
    }
}
