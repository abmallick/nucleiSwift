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
    
    func getParents(nodeId : Int) throws -> [Node]? {
        if let temp = rootId[nodeId] {
            print("Parents: \n")
            return temp.getParentsValues()
        }
        else{
            throw CustomErrors.noNode
        }
    }
    
    func getChildren(nodeId : Int) throws -> [Node]? {
        if let temp = rootId[nodeId] {
            print("Children: \n")
            return temp.getChildrenValues()
        }
        else{
            throw CustomErrors.noNode
        }
    }
    
    func getAncestors(nodeId : Int) throws -> [Node]? {
        if let temp = rootId[nodeId] {
            print("Ancestors: \n")
            return temp.getAncestors()
        }
        else{
            throw CustomErrors.noNode
        }
    }
    
    func getDescendants(nodeId : Int) throws -> [Node]? {
        if let temp = rootId[nodeId] {
            print("Descendants: \n")
            return temp.getDescendants()
        }
        else{
            throw CustomErrors.noNode
        }
    }
    
    func addDependency(parentId : Int , childId : Int) throws {
        var parent : Node?
        var child : Node?
        if let temp = rootId[parentId] {
            parent = temp
        }
        else {
            throw CustomErrors.noParent
        }
        
        if let temp = rootId[childId] {
            child = temp
        }
        else {
            throw CustomErrors.noChild
        }
        
        if let temp = child?.getDescendants() {
            if temp.contains(parent!) {
                throw CustomErrors.cyclicDependency
            }
        }
        
        if let temp = parent?.getAncestors() {
            if temp.contains(child!) {
                throw CustomErrors.cyclicDependency
            }
        }
        
        parent?.addChild(child : child!)
        child?.addParent(parent: parent!)
        print("Dependency added")
    }
    
    func removeDependency(parentId : Int, childId : Int) throws {
        var parent : Node?
        var child : Node?
        if let temp = rootId[parentId] {
            parent = temp
        }
        else {
            throw CustomErrors.noParent
        }
        
        if let temp = rootId[childId] {
            child = temp
        }
        else {
            throw CustomErrors.noChild
        }
        
        parent?.removeChild(childId: childId)
        child?.removeParent(parentId: parentId)
        print("Dependency removed")
    }
    
    func addNode(nodeId : Int, name : String) {
        rootId.updateValue(Node(id: nodeId, name : name), forKey: nodeId)
        print("Node added")
    }
    
    func deleteNode(nodeId : Int) throws {
        var children = [Node]()
        var parents = [Node]()
        
        if let temp = rootId[nodeId] {
            children = temp.getChildrenValues()
            parents = temp.getParentsValues()
        }
        else {
            throw CustomErrors.noNode
        }
        
        for p in parents {
            p.removeChild(childId: nodeId)
        }
        
        for c in children {
            c.removeParent(parentId: nodeId)
        }
        rootId.removeValue(forKey: nodeId)
        print("Node deleted!")
    }
}
