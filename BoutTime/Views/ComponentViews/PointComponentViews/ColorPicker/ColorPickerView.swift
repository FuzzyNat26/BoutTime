//
//  ColorPickerView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct ColorPickerView: View {
    // SELECTED COLOR KEY BINDING
    // REFER TO colorConstants[KEY]
    @Binding var selectedColorKey: Int;
    
    var body: some View {
        // FOREACH CONSTANTS IN COLORCONSTANTS
        // SORT BY 0 - ..., CREATE COLORCIRCLE VIEW WITH KEY
        // AND SELECTED COLOR KEY BINDING
        ForEach(Array(colorConstants.keys).sorted(by: <), id: \.self) { key in
            ZStack {
                ColorCircle(key: key, selectedColorKey: $selectedColorKey)
            }.onTapGesture {
                selectedColorKey = key
            }
            
            // IF COLOR CONSTANTS NOT THE LAST, THEN ADD SPACER()
            if (key != colorConstants.count - 1) {
                Spacer()
            }
        }
    }
}
