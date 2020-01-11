//
//  graph.swift
//  Assignment3
//
//  Created by Abhinav Kumar on 09/01/20.
//  Copyright © 2020 Abhinav Mallick. All rights reserved.
//

import Foundation

class Graph {
    var root : Node
    var rootId = [Int : Node]()
    
    init(root : Node) {
        self.root = root
        rootId.updateValue(root, forKey: root.getId())
    }
    
    func getNodeGraphId() -> [Int : Node] {
        return rootId
    }
    
    func getRoot() -> Node {
        return root
    }
    
    func getParents(nodeId : Int) -> [Node]? {
        if let temp = rootId[nodeId] {
            return temp.getParentsValues()
        }
        else{
            print("Node does not exist!")
            return nil
        }
    }
    
    func getChildren(nodeId : Int) -> [Node]? {
        if let temp = rootId[nodeId] {
            return temp.getChildrenValues()
        }
        else{
            print("Node does not exist!")
            return nil
        }
    }
    
    func getAncestors(nodeId : Int) -> [Node]? {
        if let temp = rootId[nodeId] {
            return temp.getAncestors()
        }
        else{
            print("Node does not exist!")
            return nil
        }
    }
    
    func getDescendants(nodeId : Int) -> [Node]? {
        if let temp = rootId[nodeId] {
            return temp.getDescendants()
        }
        else{
            print("Node does not exist!")
            return nil
        }
    }
    
    func addDependency(parentId : Int , childId : Int) {
        var parent : Node?
        var child : Node?
        if let temp = rootId[parentId] {
            parent = temp
        }
        else {
            print("Given parent id does not exist")
            return
        }
        
        if let temp = rootId[childId] {
            child = temp
        }
        else {
            print("Given child id does not exist")
            return
        }
        
        if let temp = child?.getDescendants() {
            if temp.contains(parent!) {
                print("Cyclic dependency cannot insert")
                return
            }
        }
        
        if let temp = parent?.getAncestors() {
            if temp.contains(child!) {
                print("Cyclic dependency cannot insert")
                return
            }
        }
        
        parent?.addChild(child : child!)
        child?.addParent(parent: parent!)
    }
    
    func removeDependency(parentId : Int, childId : Int) {
        var parent : Node?
        var child : Node?
        if let temp = rootId[parentId] {
            parent = temp
        }
        else {
            print("Given parent id does not exist")
            return
        }
        
        if let temp = rootId[childId] {
            child = temp
        }
        else {
            print("Given child id does not exist")
            return
        }
        
        parent?.removeChild(childId: childId)
        child?.removeParent(parentId: parentId)
    }
    
    func addNode(nodeId : Int, name : String) {
        rootId.updateValue(Node(id: nodeId, name : name), forKey: nodeId)
    }
    
    func deleteNode(nodeId : Int) {
        var children = [Node]()
        var parents = [Node]()
        
        if let temp = rootId[nodeId] {
            children = temp.getChildrenValues()
            parents = temp.getParentsValues()
        }
        
        for p in parents {
            p.removeChild(childId: nodeId)
        }
        
        for c in children {
            c.removeParent(parentId: nodeId)
        }
        rootId.removeValue(forKey: nodeId)
    }
}
