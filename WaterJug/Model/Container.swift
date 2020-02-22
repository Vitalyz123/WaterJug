//
//  Container.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import Foundation

struct Container {
    var capacity: Int
    var progress: Int = 0
    
    init(capacity: Int) { self.capacity = capacity }
    
    mutating func fill() { progress = capacity }

    mutating func clear() { progress = 0 }

    func isFull() -> Bool { progress == capacity }
    func isEmpty() -> Bool { progress == 0 }
    func leftToFull() -> Int { capacity - progress }
}
