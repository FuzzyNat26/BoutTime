//
//  ColorCircle.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct ColorCircle: View {
    // CURRENT SELECTED KEY
    var key:Int
    
    // SELECTEDCOLORKEY BINDING
    @Binding var selectedColorKey: Int;
    
    var body: some View {
        // OUTER CIRCLE (IF SELECTED, OPACITY 1)
        Circle()
            .strokeBorder(colorConstants[key] ?? .black,
                          lineWidth: 3)
            .frame(width: 45, height: 45)
            .opacity(selectedColorKey == key ? 1 : 0)
        
        // INNER STATIC CIRCLE
        Circle()
            .foregroundColor(colorConstants[key])
            .frame(width: 32, height: 32)
    }
}
