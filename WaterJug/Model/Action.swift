//
//  Action.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import Foundation

enum Action {
    case emptyContainerX, emptyContainerY, fillContainerX, fillContainerY, poorXToY, poorYToX, containerXfound, containerYfound, noSolution
    
    var readableResult: String {
        switch self {
        case .emptyContainerX:  return "Empty X container"
        case .emptyContainerY:  return "Empty Y container"
        case .fillContainerX:   return "Fill X container"
        case .fillContainerY:   return "Fill Y container"
        case .poorXToY:         return "Poor from X to Y"
        case .poorYToX:         return "Poor from Y to X"
        case .containerXfound:  return "X Container has Z amount"
        case .containerYfound:  return "Y Contianer has Z amount"
        case .noSolution:       return "No solution"
        }
    }
}
