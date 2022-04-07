//
//  UserLevelConstants.swift
//  BoutTime
//
//  Created by Jonathan Lee on 07/04/22.
//

import Foundation

func hitungLevelUser(totalPoin: Int) -> Array<Int> {
    var levelUser: Int;
    var startFrom: Int;
    var endFrom: Int;
    
    switch(totalPoin) {
    case  _ where totalPoin >= 1000 :
        levelUser = 5
        
        startFrom = 1000
        endFrom = 1000
    case  _ where totalPoin >= 500:
        levelUser = 4
        
        startFrom = 500
        endFrom = 1000
    case  _ where totalPoin >= 250:
        levelUser = 3
        
        startFrom = 250
        endFrom = 500
    case _ where totalPoin >= 100:
        levelUser = 2
        
        startFrom = 100
        endFrom = 250
    default:
        levelUser = 1
        
        startFrom = 0
        endFrom = 100
    }
    
    return [levelUser, startFrom, endFrom]
}

func checkIconLock(levelUser: Int, systemName: String) -> Bool {
    var result: Bool = true;
    
    switch(systemName) {
    case "star.fill":
        if(levelUser >= 1) {
            result = false
        }
    case "moon.fill":
        if(levelUser >= 2) {
            result = false
        }
    case "sparkles":
        if(levelUser >= 3) {
            result = false
        }
    case "leaf.fill":
        if(levelUser >= 4) {
            result = false
        }
    case "heart.fill":
        if(levelUser >= 5) {
            result = false
        }
    default:
        result = false
    }
    
    return result
}

func checkColorLock(levelUser: Int, colorKey: Int) -> Bool {
    var result: Bool = true;
    
    switch(colorKey) {
    case 0:
        if(levelUser >= 1) {
            result = false
        }
    case 1:
        if(levelUser >= 2) {
            result = false
        }
    case 2:
        if(levelUser >= 3) {
            result = false
        }
    case 3:
        if(levelUser >= 4) {
            result = false
        }
    case 4:
        if(levelUser >= 5) {
            result = false
        }
    default:
        result = false
    }
    
    return result
}
