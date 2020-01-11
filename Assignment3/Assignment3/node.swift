//
//  node.swift
//  Assignment3
//
//  Created by Abhinav Kumar on 09/01/20.
//  Copyright © 2020 Abhinav Mallick. All rights reserved.
//

import Foundation

class Node : Equatable, CustomStringConvertible {
    //id, name, addInfo, parents, children
    var id : Int
    var name : String
    var addInfo = [String : AnyObject]()
    var parents = [Int : Node]()
    var children = [Int : Node]()
    
    init(id : Int, name : String) {
        self.id = id
        self.name = name
    }
    
    func getId() -> Int {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    func setAddInfo(addInfo : [String : AnyObject]) -> Void {
        self.addInfo = addInfo
    }
    
    func getAddInfo() -> [String : AnyObject] {
        return addInfo
    }
    
    func getParents() -> [Int : Node] {
        return parents
    }
    
    func getChildren() -> [Int : Node] {
        return children
    }
    
    func getParentsValues() -> [Node] {
        var parentValues = [Node]()
        for val in parents {
            parentValues.append(val.value)
        }
        return parentValues
    }
    
    func getChildrenValues() -> [Node] {
        var childrenValues = [Node]()
        for val in children {
            childrenValues.append(val.value)
        }
        return childrenValues
    }
    
    func addParent(parent : Node) -> Void {
        parents.updateValue(parent, forKey: parent.getId())
    }
    
    func addChild(child : Node) -> Void {
        children.updateValue(child, forKey: child.getId())
    }
    
    func removeParent(parentId : Int) {
        parents.removeValue(forKey: parentId)
    }
    
    func removeChild(childId : Int) {
        children.removeValue(forKey: childId)
    }
    
    func getAncestors() -> [Node] {
        var ancestors = getParentsValues()
        
        for a in ancestors {
            for p in a.getParentsValues(){
                ancestors.append(p)
            }
        }
        
        return ancestors
    }
    
    func getDescendants() -> [Node] {
        var descendants = getChildrenValues()
        
        for d in descendants {
            for c in d.getChildrenValues() {
                descendants.append(c)
            }
        }
        return descendants
    }
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.getId() == rhs.getId() && lhs.getName() == rhs.getName()
    }
    
    public var description : String {
        return "name = \(name) node Id = \(id)"
    }
}
