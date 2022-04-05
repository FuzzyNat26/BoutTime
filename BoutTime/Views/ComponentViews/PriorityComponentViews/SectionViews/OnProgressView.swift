//
//  OnProgressView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct OnProgressView: View {
    // CONTEXT
    @Environment(\.managedObjectContext) var viewContext
    
    // FETCH REQUEST
    @FetchRequest(
        entity: PriorityItem.entity(),
        sortDescriptors: prioritySortDescriptors,
        predicate: NSPredicate(format: "priorityIsChecked == false"),
        animation: .default)
    
    // PRIORITY OBJECTS (PRIORITY COLLECTIONS)
    private var priorities: FetchedResults<PriorityItem>
    
    // EDITMODE
    @Binding var isEdit: Bool;
    
    var body: some View {
        Section(header: Text("Sedang Dikerjakan").font(.headline)) {
            Group {
                ForEach(priorities, id: \.self) {
                    priority in
                    ListCardView(
                        isEdit: $isEdit, priorityObject: priority,
                        isChecked: priority.priorityIsChecked
                    )
                }
                .onDelete(perform: deletePriorities)
            }
        }
    }
    
    // DELETE PRIORITY
    private func deletePriorities(offsets: IndexSet) {
        withAnimation {
            // LOOP THROUGH OFFSETS AND DELETE THOSE INDEXES
            offsets.map { priorities[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // AUTO GENERATED CODE BY CORE DATA
                
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
