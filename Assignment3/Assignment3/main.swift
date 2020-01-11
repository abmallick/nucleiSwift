//
//  main.swift
//  Assignment3
//
//  Created by Abhinav Kumar on 09/01/20.
//  Copyright © 2020 Abhinav Mallick. All rights reserved.
//

//import Foundation

//choice, nodeId, parentId, childId
var choice : Int = -1
var nodeId : Int = -1
var parentId : Int = -1
var childId : Int = -1
var name : String = ""
var tree = Graph(root : Node(id : 0, name : "root"))

while(true) {
    print(" 1. Get Immediate parents of a node\n 2. Get immediate children of a node\n 3. Get ancestors of a node\n 4. Get descendants of anode\n 5. Delete dependency from the tree\n 6. Delete node from the tree\n 7. Add a new dependency to the tree\n 8. Add a new node to the tree")
    
    if let temp = Int(readLine()!) {
        choice = temp
    }
    
    switch choice {
    case 1: //immediate parents
            print("Enter node id\n")
            if let temp = Int(readLine()!) {
                nodeId = temp
            }
            print("Parents: \n")
            
            for n in tree.getParents(nodeId: nodeId)! {
                print(n)
            }
            break
    
    case 2: //immediate children
            print("Enter node id\n")
            if let temp = Int(readLine()!) {
                nodeId = temp
            }
            print("Children: \n")
        
            for n in tree.getChildren(nodeId: nodeId)! {
                print(n)
            }
            break
        
    case 3: //ancestors
            print("Enter Node id\n")
            if let temp = Int(readLine()!) {
                nodeId = temp
            }
            print("Ancestors: \n")
        
            for n in tree.getAncestors(nodeId: nodeId)! {
                print(n)
            }
            break
    case 4: //descendants
            print("Enter Node id \n")
            if let temp = Int(readLine()!) {
                nodeId = temp
            }
            print("Descendants: \n")
            
            for n in tree.getDescendants(nodeId: nodeId)! {
                print(n)
            }
            break
    case 5: //delete dependency
            print("Enter parent node id\n")
            if let temp = Int(readLine()!) {
                parentId = temp
            }
            print("Enter child node id\n")
            if let temp = Int(readLine()!) {
                childId = temp
            }
            tree.removeDependency(parentId: parentId, childId: childId)
            print("Dependency removed")
            break
        
    case 6: //delete node
            print("Enter node id")
            if let temp = Int(readLine()!) {
                nodeId = temp
            }
            tree.deleteNode(nodeId: nodeId)
            print("Node deleted!")
            break
        
    case 7: //Add dependency
            print("Enter parent node id\n")
            if let temp = Int(readLine()!) {
                parentId = temp
            }
            print("Enter child node id\n")
            if let temp = Int(readLine()!) {
                childId = temp
            }
            tree.addDependency(parentId: parentId, childId: childId)
            print("Dependency added")
            break
    
    case 8: //Add node
            print("Enter node id")
            if let temp = Int(readLine()!) {
                nodeId = temp
            }
            print("Enter node name")
            if let temp = readLine() {
                name = temp
            }
            tree.addNode(nodeId: nodeId, name: name)
            print("Node added")
            break
    default:    print("Invalid option!")
        
    }
    
    
    
}
