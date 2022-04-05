//
//  OnProgressView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct OnProgressView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        entity: PriorityItem.entity(),
        sortDescriptors: prioritySortDescriptors,
        predicate: NSPredicate(format: "priorityIsChecked == false"),
        animation: .default)
    
    private var priorities: FetchedResults<PriorityItem>
    
    var body: some View {
//        if(!priorities.isEmpty) {
            Section(header: Text("Sedang Dikerjakan").font(.headline)) {
                Group {
                    ForEach(priorities, id: \.self) {
                        priority in
                        ListCardView(
                            priorityObject: priority,
                            priorityTitle: priority.priorityTitle!,
                            priorityDate: priority.priorityFinishedDate!,
                            priorityUrgencyLevel: priority.priorityUrgencyLevel!,
                            priorityPoints: Int(priority.priorityPoint),
                            isChecked: priority.priorityIsChecked
                        )
                    }
                  .onDelete(perform: deletePriorities)
//                    .swipeActions(edge: .trailing) {
//                        Button("Delete a6") {
//                            // deleteItems(offsets: IndexSet.Type)
//                            print("Hlelo")
//                        }.tint(.red)
//                        Button("Delete") {
//                        }
//                    }
                }
            }
//        }
    }
    
    private func deletePriorities(offsets: IndexSet) {
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
