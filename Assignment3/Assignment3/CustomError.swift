//
//  CustomError.swift
//  Assignment3
//
//  Created by Abhinav Kumar on 17/01/20.
//  Copyright © 2020 Abhinav Mallick. All rights reserved.
//

import Foundation

enum CustomErrors : Error {
    case noNode
    case cyclicDependency
    case noChild
    case noParent
}
