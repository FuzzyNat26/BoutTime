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
    
    var levelUser: Int;
    
    var body: some View {
        // FOREACH CONSTANTS IN COLORCONSTANTS
        // SORT BY 0 - ..., CREATE COLORCIRCLE VIEW WITH KEY
        // AND SELECTED COLOR KEY BINDING
        ForEach(Array(checkboxColorConstants.keys).sorted(by: <), id: \.self) { key in
            ColorCircle(
                key: key,
                levelUser : levelUser,
                selectedColorKey: $selectedColorKey
            )
            // IF COLOR CONSTANTS NOT THE LAST, THEN ADD SPACER()
            if (key != checkboxColorConstants.count - 1) {
                Spacer()
            }
        }
    }
}
