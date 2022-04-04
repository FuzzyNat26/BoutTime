//
//  ColorPickerView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedColorKey: Int;
    
    var body: some View {
        ForEach(Array(colorConstants.keys).sorted(by: <), id: \.self) { key in
            ZStack {
                ColorCircle(key: key, selectedColorKey: $selectedColorKey)
            }.onTapGesture {
                selectedColorKey = key
            }
            
            if (key != colorConstants.count - 1) {
                Spacer()
            }
        }
    }
}
