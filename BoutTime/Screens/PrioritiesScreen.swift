//
//  PrioritiesScreen.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct PrioritiesScreen: View {
    @State var showAddSheetView = false;
    @State var isEdit: Bool = false;
    
    var body: some View {
        NavigationView {
            List {
                OnProgressView(isEdit: $isEdit)
                FinishedView(isEdit: $isEdit)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isEdit.toggle()
                    }) {
                        Text(isEdit ? "Done" : "Edit")
                    }
                }
                ToolbarItem {
                    Button(action: {
                        showAddSheetView = true;
                    }) {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle(Text("Priorities"))
            .environment(
                \.editMode,
                 .constant(self.isEdit ? EditMode.active : EditMode.inactive)
            )
            .animation(Animation.default, value: isEdit)
            
        }.sheet(isPresented: $showAddSheetView, onDismiss: {
            print("Dismissed")
        }) {
            AddPrioritySheetView(showSheetView: $showAddSheetView)
        }
    }
}

struct PrioritiesScreen_Previews: PreviewProvider {
    static var previews: some View {
        PrioritiesScreen()
    }
}
