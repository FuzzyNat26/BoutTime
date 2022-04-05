//
//  CheckBoxView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding public var isChecked: Bool
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var priorityObject: PriorityItem;
    
    private func toggle() {
        isChecked = !isChecked
        updateCheck()
    }
    
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
                    .foregroundColor(.red)
            }
        }
    }
}

//struct CheckBoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckBoxView()
//    }
//}
