//
//  NumberFormatter.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import Foundation

func thousandSeperators(points: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal;
    
    return formatter.string(from: points as NSNumber) ?? "0"
}
