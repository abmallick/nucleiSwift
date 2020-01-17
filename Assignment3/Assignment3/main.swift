//
//  main.swift
//  Assignment3
//
//  Created by Abhinav Kumar on 09/01/20.
//  Copyright © 2020 Abhinav Mallick. All rights reserved.
//

//import Foundation

//choice, nodeId, parentId, childId
var choice : Int?
var name : String?
var tree = Graph(root : Node(id : 0, name : "root"))

while(true) {
    print(" 1. Get Immediate parents of a node\n 2. Get immediate children of a node\n 3. Get ancestors of a node\n 4. Get descendants of anode\n 5. Delete dependency from the tree\n 6. Delete node from the tree\n 7. Add a new dependency to the tree\n 8. Add a new node to the tree")
    choice = nil
    while choice == nil {
        if let temp = readLine() {
            choice = Int(temp)
        }
    }
    
    switch choice {
    case 1: //immediate parents
            var nodeId : Int?
            while nodeId == nil {
                print("Enter node id\n")
                if let temp = readLine() {
                    nodeId = Int(temp)
                }
            }
            
            do {
                for n in try tree.getParents(nodeId: nodeId!)! {
                    print(n)
                }
            } catch CustomErrors.noNode {
                print("No such node exists!")
            }
            break
    
    case 2: //immediate children
            var nodeId : Int?
            while nodeId == nil {
                print("Enter node id\n")
                if let temp = readLine() {
                    nodeId = Int(temp)
                }
            }
            
            do {
                for n in try tree.getChildren(nodeId: nodeId!)! {
                    print(n)
                }
            } catch CustomErrors.noNode {
                print("No such node exists!")
            }
            break
        
    case 3: //ancestors
            var nodeId : Int?
            while nodeId == nil {
                print("Enter node id\n")
                if let temp = readLine() {
                    nodeId = Int(temp)
                }
            }
            
            do {
                for n in try tree.getAncestors(nodeId: nodeId!)! {
                    print(n)
                }
            } catch CustomErrors.noNode {
                print("No such node exists!")
            }
            break
    case 4: //descendants
            var nodeId : Int?
            while nodeId == nil {
                print("Enter node id\n")
                if let temp = readLine() {
                    nodeId = Int(temp)
                }
            }
            
            do {
                for n in try tree.getDescendants(nodeId: nodeId!)! {
                    print(n)
                }
            } catch CustomErrors.noNode {
                print("No such node exists!")
            }
            break
    case 5: //delete dependency
            var parentId : Int?
            var childId : Int?
            
            while parentId == nil {
                print("Enter parent node id\n")
                if let temp = Int(readLine()!) {
                    parentId = temp
                }
            }
            
            while childId == nil {
                print("Enter child node id\n")
                if let temp = Int(readLine()!) {
                    childId = temp
                }
            }
            
            do {
                try tree.removeDependency(parentId: parentId!, childId: childId!)
            } catch CustomErrors.noParent {
                print("No such parent exists!")
            } catch CustomErrors.noChild {
                print("No such child exists!")
            }
            break
        
    case 6: //delete node
            var nodeId : Int?
            while nodeId == nil {
                print("Enter node id\n")
                if let temp = readLine() {
                    nodeId = Int(temp)
                }
            }
            
            do {
                try tree.deleteNode(nodeId: nodeId!)
            } catch CustomErrors.noNode {
                print("No such node exists!")
            }
            break
        
    case 7: //Add dependency
            var parentId : Int?
            var childId : Int?
            
            while parentId == nil {
                print("Enter parent node id\n")
                if let temp = Int(readLine()!) {
                    parentId = temp
                }
            }
            
            while childId == nil {
                print("Enter child node id\n")
                if let temp = Int(readLine()!) {
                    childId = temp
                }
            }
            
            do {
                try tree.addDependency(parentId: parentId!, childId: childId!)
            } catch CustomErrors.noParent {
                print("No such parent exists!")
            } catch CustomErrors.noChild {
                print("No such child exists!")
            }
            break
    
    case 8: //Add node
            var nodeId : Int?
            while nodeId == nil {
                print("Enter node id\n")
                if let temp = readLine() {
                    nodeId = Int(temp)
                }
            }
            print("Enter node name")
            if let temp = readLine() {
                name = temp
            }
            tree.addNode(nodeId: nodeId!, name: name!)
            break
    default:    print("Invalid option!")
    
    }
    
    
    
}
