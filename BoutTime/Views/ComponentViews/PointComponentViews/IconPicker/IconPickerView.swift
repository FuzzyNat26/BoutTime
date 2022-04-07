//
//  IconPickerView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 05/04/22.
//

import SwiftUI

struct IconPickerView: View {
    // SELECTED ICON KEY BINDING
    @Binding var selectedIcon: String;
    
    var levelUser: Int;
    
    var body: some View {
        // FOREACH CONSTANTS IN SYSTEMNAMELIST
        ForEach(profileIconList, id: \.self) { icon in
            IconCircle(
                thisIcon: icon,
                levelUser : levelUser,
                selectedIcon: $selectedIcon
            )
            
            // IF ICON NOT THE LAST, THEN ADD SPACER()
            if (icon != profileIconList.last) {
                Spacer()
            }
        }
    }

}
//
//struct IconPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        IconPickerView()
//    }
//}
