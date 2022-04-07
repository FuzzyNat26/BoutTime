//
//  ColorCircle.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct ColorCircle: View {
    // COLOR ENVIRONMENT (LIGHT MODE DARK MODE)
    @Environment(\.colorScheme) var colorScheme
 
    
    // CURRENT SELECTED KEY
    var key:Int
    var levelUser: Int
    
    // SELECTEDCOLORKEY BINDING
    @Binding var selectedColorKey: Int;
    
    var body: some View {
        ZStack {
            // OUTER CIRCLE (IF SELECTED, OPACITY 1)
            Circle()
                .strokeBorder(colorConstants[key] ?? .black,
                              lineWidth: 3)
                .frame(width: 45, height: 45)
                .opacity(selectedColorKey == key ? 1 : 0)
            
            if(checkColorLock(levelUser: levelUser, colorKey: key)) {
                // OUTER CIRCLE BUKAN UNTUK PILIH
                Circle()
                    .fill(colorScheme == .light ? Color(UIColor.secondarySystemBackground) : Color(UIColor.darkGray))
                    .frame(width: 34, height: 34)
                
                Image(systemName: "lock.fill")
                    .foregroundColor(colorScheme == .light ? .gray : .white)
                    .frame(width: 32, height: 32)
            } else {
                // INNER STATIC CIRCLE
                Circle()
                    .foregroundColor(colorConstants[key])
                    .frame(width: 32, height: 32)
            }
        }.onTapGesture {
            if(!checkColorLock(levelUser: levelUser, colorKey: key)) {
                selectedColorKey = key
            }
        }
    }
}
