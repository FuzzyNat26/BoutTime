//
//  OnProgressView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct OnProgressView: View {
    //    @Environment(\.managedObjectContext) var context
    //    @FetchRequest(entity: Priorities.entity(), sortDescriptors: []) var priorities: FetchedResults<Priorities>
   
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: PriorityItem.entity(),
        sortDescriptors: [],
        predicate: NSPredicate(format: "priorityIsChecked == false"),
        animation: .default)
    
    private var priorities: FetchedResults<PriorityItem>
    
    
//    private func populatePriorities() {
//        priorities = coreDM.getAllPriorities()
//    }
    
    var body: some View {
        Section(header: Text("Sedang Dikerjakan").font(.headline)) {
            Group {
                ForEach(priorities, id: \.self) {
                    priority in
                    ListCardView(
                        priorityTitle: priority.priorityTitle!,
                        priorityDate: priority.priorityFinishedDate!,
                        priorityUrgencyLevel: priority.priorityUrgencyLevel!,
                        priorityPoints: Int(priority.priorityPoint),
                        isChecked: priority.priorityIsChecked
                    )
                }
//                .onDelete(perform: deleteItems)
                .swipeActions(edge: .leading) {
                    Button("Edit") {
                        print("Edit")
                    }
                }
                    .swipeActions(edge: .trailing) {
                    Button("Delete a6") {
                        deleteItems(offsets: IndexSet.Type)
                    }
                }
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { priorities[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

//struct OnProgressView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnProgressView()
//    }
//}
