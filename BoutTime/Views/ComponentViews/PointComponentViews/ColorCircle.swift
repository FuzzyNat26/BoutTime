//
//  ColorCircle.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct ColorCircle: View {
    var key:Int
    
    @Binding var selectedColorKey: Int;
    
    var body: some View {
        Circle()
            .strokeBorder(colorConstants[key] ?? .black,
                          lineWidth: 3)
            .frame(width: 45, height: 45)
            .opacity(selectedColorKey == key ? 1 : 0)
        Circle()
            .foregroundColor(colorConstants[key])
            .frame(width: 32, height: 32)
    }
}

//struct ColorCircle_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorCircle()
//    }
//}
