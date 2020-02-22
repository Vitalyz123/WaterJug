//
//  ActionManager.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import Foundation


final class ActionManager {
    private var containerX: Container
    private var containerY: Container
    
    let valueToFind: Int
    
    // Vars to track progress
    private var result: [StateAction] = []

    private var states: Set<ContainersState> = []
    private var currentState: ContainersState = .init(progressX: 0, progressY: 0)

    init(X: Int, Y: Int, Z: Int) {
        containerX = Container.init(capacity: X)
        containerY = Container.init(capacity: Y)
        valueToFind = Z
    }
    
    func fundSolution() -> [StateAction] {
        result = []
        
        startSearch()
        
        return result
    }
    
    private func startSearch() {
        
        //We can only track new states otherwise no solution
        if states.contains(currentState) {
            result = []

            result.append((.init(progressX: 0, progressY: 0), .noSolution))
            
            return
        }
            
        // Check if X reached searched value
        if containerX.progress == valueToFind {
            result.append((currentState, .containerXfound))
            
            return
        }

        // Check if Y reached searched value
        if containerY.progress == valueToFind {
            result.append((currentState, .containerYfound))

            return
        }

        states.insert(currentState)

        // Next action
        if containerX.isEmpty() {
            containerX.fill()
            currentState = .init(progressX: containerX.progress, progressY: containerY.progress)
            result.append((currentState, .fillContainerX))

            startSearch()
            
            return
        }
        
        if containerY.isFull() {
            containerY.clear()
            
            currentState = .init(progressX: containerX.progress, progressY: containerY.progress)
            result.append((currentState, .emptyContainerY))
        }
        
        let transferAmount = min(containerY.leftToFull(), containerX.progress)
        
        containerX.progress -= transferAmount
        containerY.progress += transferAmount
        
        currentState = .init(progressX: containerX.progress, progressY: containerY.progress)
        result.append((currentState, .poorXToY))

        startSearch()
    }
}

struct ContainersState: Hashable {
    var progressX: Int
    var progressY: Int
    
    func readableResult() -> String {
        "Container X has \(progressX)\nContainer Y has \(progressY)"
    }
}

typealias StateAction = (ContainersState, Action)
