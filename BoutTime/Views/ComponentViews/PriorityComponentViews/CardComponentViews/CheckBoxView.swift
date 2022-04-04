//
//  CheckBoxView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding public var isChecked: Bool
    
    private func toggle(){
        isChecked = !isChecked
    }
    
    public var body: some View {
        Button(action: toggle){
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
            }
        }
    }
}

//struct CheckBoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckBoxView()
//    }
//}
