//
//  LevelObserver.swift
//  BoutTime
//
//  Created by Jonathan Lee on 07/04/22.
//

import SwiftUI

class LevelObserver: ObservableObject {
    @Published var levelUser = 0
    
    func setLevel(level: Int) {
        levelUser = level
    }
}
