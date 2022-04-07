//
//  IconCircle.swift
//  BoutTime
//
//  Created by Jonathan Lee on 05/04/22.
//

import SwiftUI

struct IconCircle: View {
    // COLOR ENVIRONMENT (LIGHT MODE DARK MODE)
    @Environment(\.colorScheme) var colorScheme
    
    // SELECTEDCOLORKEY BINDING
    var thisIcon: String;
    var levelUser: Int;
    
    @Binding var selectedIcon: String;
    
    var body: some View {
        ZStack {
            // OUTER CIRCLE (IF SELECTED, OPACITY 1)
            Circle()
                .strokeBorder(.gray,
                              lineWidth: 3)
                .frame(width: 45, height: 45)
                .opacity(selectedIcon == thisIcon ? 1 : 0)
            
            // OUTER CIRCLE BUKAN UNTUK PILIH
            Circle()
                .fill(colorScheme == .light ? Color(UIColor.secondarySystemBackground) : Color(UIColor.darkGray))
                .frame(width: 34, height: 34)
            
            // INNER STATIC CIRCLE
            Image(systemName: checkIconLock(levelUser: levelUser, systemName: thisIcon) ? "lock.fill" : thisIcon)
                .foregroundColor(colorScheme == .light ? .gray : .white)
                .frame(width: 32, height: 32)
        }
        .onTapGesture {
            if(!checkIconLock(levelUser: levelUser, systemName: thisIcon)) {
                selectedIcon = thisIcon
            }
        }
    }
}
