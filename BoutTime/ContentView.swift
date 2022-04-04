//
//  ContentView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.editMode) private var editMode
    @State private var name = "Maria Ruiz"

    var body: some View {
        NavigationView {
            Form {
                if editMode?.wrappedValue.isEditing == true {
                    TextField("Name", text: $name)
                } else {
                    Text("Halo Bos")
                }
            }
            .animation(nil, value: editMode?.wrappedValue)
            .toolbar { // Assumes embedding this view in a NavigationView.
                EditButton()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
