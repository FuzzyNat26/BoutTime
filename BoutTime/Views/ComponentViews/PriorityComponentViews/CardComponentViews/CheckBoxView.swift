//
//  CheckBoxView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct CheckBoxView: View {
    // CHECKBOX BINDING
    @Binding public var isChecked: Bool
    
    // APP STORAGE
    @AppStorage("UserColorKey") var colorKey: Int = 0

    // ENVIRONMENT CONTEXT : FOR UPDATING CHECKBOX
    @Environment(\.managedObjectContext) private var viewContext
    
    // PRIOTITY OBJECT
    var priorityObject: PriorityItem;
    
    // TOGGLE BUTTON
    private func toggle() {
        isChecked = !isChecked
        updateCheck()
    }
    
    // UPDATE CHECK FUNCTION
    func updateCheck() {
        viewContext.performAndWait {
            priorityObject.priorityIsChecked = isChecked
            try? viewContext.save()
        }
    }
    
    var body: some View {
        Button(action: toggle){
            HStack{
                Image(systemName:
                        isChecked
                      ? "checkmark.circle.fill"
                      : "circle")
                .resizable()
                .foregroundColor(
                    isChecked
                    ? checkboxColorConstants[colorKey]
                    : .gray
                )
                .frame(width: 22, height: 22)
            }
        }
    }
}
