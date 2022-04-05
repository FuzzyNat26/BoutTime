//
//  PrioritiesScreen.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct PrioritiesScreen: View {
    @State var showAddSheetView = false;
  
    var body: some View {
        NavigationView {
            List {
                OnProgressView()
                FinishedView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
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
