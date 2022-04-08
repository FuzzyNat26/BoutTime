//
//  LevelObserver.swift
//  BoutTime
//
//  Created by Jonathan Lee on 07/04/22.
//

import SwiftUI

class LevelObserver: ObservableObject {
    @Published var levelUser = 1
    
    @Published var colorKey = 1
    
    func setLevel(level: Int) {
        levelUser = level
        colorKey = level - 1
    }
}
