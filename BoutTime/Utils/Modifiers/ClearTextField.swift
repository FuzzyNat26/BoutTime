//
//  ClearTextField.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct TextClearField: ViewModifier
{
    @Binding var text: String
    
    public func body(content: Content) -> some View
    {
        HStack()
        {
            content
            Spacer()
            if !text.isEmpty
            {
                Button(action:
                        {
                    self.text = ""
                })
                {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
