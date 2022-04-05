//
//  IconCircle.swift
//  BoutTime
//
//  Created by Jonathan Lee on 05/04/22.
//

import SwiftUI

struct IconCircle: View {
    // SELECTEDCOLORKEY BINDING
    var thisIcon: String;
    
    @Binding var selectedIcon: String;
    
    var body: some View {
        // OUTER CIRCLE (IF SELECTED, OPACITY 1)
        Circle()
            .strokeBorder(.gray,
                          lineWidth: 3)
            .frame(width: 45, height: 45)
            .opacity(selectedIcon == thisIcon ? 1 : 0)
        
        // INNER STATIC CIRCLE
        Image(systemName: thisIcon)
            .foregroundColor(.white)
            .frame(width: 32, height: 32)
    }
}

//struct IconCircle_Previews: PreviewProvider {
//    static var previews: some View {
//        IconCircle()
//    }
//}
