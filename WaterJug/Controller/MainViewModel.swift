//
//  MainViewModel.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import Foundation

extension MainViewModel {
    enum ViewSection {
        case firstContainer, secondContainer, thirdContainer, results
    }
}

class MainViewModel: NSObject {
    let sections: [ViewSection] = [.firstContainer, .secondContainer, .thirdContainer, .results]
    
    private var X: Int?
    private var Y: Int?
    private var Z: Int?
    
    private (set) var result: [StateAction] = [] { didSet { didUpdateResultClosure?() } }
    var didUpdateResultClosure: (() -> Void)?
    
    var didReceiveErrorClosure: ((_ message: String) -> Void)?
    
    func section(atIndex index: Int) -> ViewSection {
        sections[index]
    }
    
    func numberOfRows(forSection section: ViewSection) -> Int {
        switch section {
        case .firstContainer, .secondContainer:
             return 1
        case .thirdContainer:
            return 2
        case .results:
            return result.count
        }
    }
    
    func setValue(_ value: Int?, forSection section: ViewSection) {
        switch section {
        case .firstContainer:
            X = value
        case .secondContainer:
            Y = value
        case .thirdContainer:
            Z = value
        case .results:
            break
        }
    }
    
    func submitInputs() {
        guard let X = X, let Y = Y, let Z = Z else { didReceiveErrorClosure?("All fields must be filled.") ; return }
        
        let manager: ActionManager = ActionManager.init(X: X, Y: Y, Z: Z)
        
        result = manager.fundSolution()
    }
}
