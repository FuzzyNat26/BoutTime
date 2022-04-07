//
//  MinMaxConverter.swift
//  BoutTime
//
//  Created by Jonathan Lee on 07/04/22.
//

import Foundation

extension BinaryInteger {
    func converting(from input: ClosedRange<Self>, to output: ClosedRange<Self>) -> Self {
        let x = (output.upperBound - output.lowerBound) * (self - input.lowerBound)
        var y = (input.upperBound - input.lowerBound)
        
        if(y == 0) {y = 1}
        return x / y + output.lowerBound
    }
}
