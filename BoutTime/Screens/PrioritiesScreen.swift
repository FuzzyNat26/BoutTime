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
    @State var selectedSortItem: String;
    @State var selectedSortIndex: Int = 0;
    
    init() {
        @AppStorage("UserSortBy") var sortByName: String = "Points"
        
        _selectedSortItem = State(initialValue: sortByName)
        _selectedSortIndex = State(initialValue : sortByConstants.firstIndex(where: {$0 == sortByName})!)
    }
    
    // UPDATE SORT BY CHOICES
    func saveSortBy() {
        selectedSortIndex = sortByConstants.firstIndex(where: {$0 == selectedSortItem})!
        UserDefaults.standard.set(selectedSortItem, forKey: "UserSortBy")
    }
    
    var body: some View {
        NavigationView {
            List {
                OnProgressView(sortByIndex: selectedSortIndex, isEdit: $isEdit)
                FinishedView(sortByIndex: selectedSortIndex, isEdit: $isEdit)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if(isEdit) {
                        withAnimation {
                            Button(action: {
                                isEdit.toggle()
                            }) {
                                Text("Done")
                                    .transition(.opacity)
                            }
                        }
                    } else {
                        Menu(content: {
                            Button(action: {
                                isEdit.toggle()
                            }) {
                                Text(isEdit ? "Done" : "Edit")
                            }
                            Divider()
                            // TODO: BETTER WAY TO SORT OBJECTS RATHER THEN RELYING ON FETCH REQUESTS
                            /// IDE BAGUS
                            /// https://stackoverflow.com/questions/63946739/how-to-animate-dynamic-list-sorting-with-swiftui-and-coredata-fetchrequest
                            /// https://stackoverflow.com/questions/14797224/uisearchdisplaycontroller-animate-reloaddata
                            Picker(selection: $selectedSortItem) {
                                ForEach(sortByConstants, id: \.self) {
                                    sortBy in
                                    Text(sortBy)
                                }
                            }
                        label: {
                            Label(title: {
                                Text("Sort by (\(selectedSortItem))")
                            }) {
                                Image(systemName: "arrow.up.arrow.down")
                            }
                        }
                        .pickerStyle(.menu)
                        }, label: {
                            Image(systemName: "ellipsis.circle")}
                        ).onChange(of: selectedSortItem, perform: {
                            _ in
                            saveSortBy()
                        })
                    }
                }
                ToolbarItem {
                    if(!isEdit) {
                        withAnimation{
                            Button(action: {
                                showAddSheetView = true;
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle(Text("Priorities"))
            .environment(
                \.editMode,
                 .constant(self.isEdit ? EditMode.active : EditMode.inactive)
            )
            .animation(.default, value: isEdit)
            
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
