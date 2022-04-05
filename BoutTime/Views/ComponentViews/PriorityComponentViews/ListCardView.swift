//
//  ListCardView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct ListCardView: View {
    // Environments
    @Environment(\.editMode) private var editMode
    
    var priorityObject: PriorityItem

    // Sheets
    @State public var showEditSheetView : Bool = false
    
    // Card variables
    public var priorityTitle: String;
    public var priorityDate: Date;
    public var priorityUrgencyLevel: String;
    public var priorityPoints: Int;

    // Card check states
    @State public var isChecked: Bool = false
    
    public var body: some View {
        HStack(alignment: .center) {
            if editMode?.wrappedValue.isEditing != true {
                withAnimation {
                    CheckBoxView(isChecked: $isChecked, priorityObject: priorityObject).transition(.scale)
                }
            }
            
            CardDetailView(
                priorityTitle: priorityTitle,
                priorityDate: priorityDate,
                priorityUrgencyLevel: priorityUrgencyLevel,
                isChecked: $isChecked
            )
//            .background(Color(UIColor.systemBackground))
            Spacer()

            if editMode?.wrappedValue.isEditing == true {
                withAnimation {
                    Button(action: showEditSheet) {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .transition(.scale)
                            .multilineTextAlignment(.trailing)
                    }.onTapGesture {
                        showEditSheet()
                    }
                }
            } else {
                PointView(isChecked: $isChecked, priorityPoint: priorityPoints)
                    .multilineTextAlignment(.trailing)
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .sheet(isPresented: $showEditSheetView) {
            EditPrioritySheetView(
                priorityItem: priorityObject,
                urgencyLevelIndex: 0,
                showSheetView: $showEditSheetView,
                namaPrioritas: priorityTitle,
                tingkatUrgensi: priorityUrgencyLevel,
                tanggalSelesai: priorityDate,
                poinSelesai: priorityPoints)
        }
        .padding(.vertical, 5.0)
        
    }
    
    func showEditSheet() {
        showEditSheetView = true
    }
}
//
//struct ListCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCardView()
//    }
//}
