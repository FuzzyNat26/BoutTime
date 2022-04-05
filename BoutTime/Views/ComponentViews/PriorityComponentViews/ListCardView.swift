//
//  ListCardView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct ListCardView: View {
    
    // EDIT MODE VARIABLES
    @Binding var isEdit: Bool;
    
    // PRIORITY OBJECT
    var priorityObject: PriorityItem

    // SHEET
    @State public var showEditSheetView : Bool = false
    
    // CARD CHECK STATE
    @State public var isChecked: Bool = false
    
    public var body: some View {
        HStack(alignment: .center) {
            if !isEdit {
                withAnimation {
                    CheckBoxView(isChecked: $isChecked, priorityObject: priorityObject)
                        .transition(.scale)
                }
            }
            
            CardDetailView(
                priorityTitle: priorityObject.priorityTitle!,
                priorityDate: priorityObject.priorityFinishedDate!,
                priorityUrgencyLevel: priorityObject.priorityUrgencyLevel!,
                isChecked: $isChecked
            )
            Spacer()

            if isEdit {
                withAnimation {
                    Button(action: showEditSheet) {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.blue)
                            .transition(.scale)
                            .multilineTextAlignment(.trailing)
                    }.onTapGesture {
                        showEditSheet()
                    }
                }
            } else {
                PointView(isChecked: $isChecked, priorityPoint: Int(priorityObject.priorityPoint))
                    .multilineTextAlignment(.trailing)
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .sheet(isPresented: $showEditSheetView) {
            EditPrioritySheetView(
                priorityItem: priorityObject,
                urgencyLevelIndex: 0,
                showSheetView: $showEditSheetView,
                namaPrioritas: priorityObject.priorityTitle!,
                tingkatUrgensi: priorityObject.priorityUrgencyLevel!,
                tanggalSelesai: priorityObject.priorityFinishedDate!,
                poinSelesai: Int(priorityObject.priorityPoint))
        }
        .padding(.vertical, 5.0)
        
    }
    
    func showEditSheet() {
        showEditSheetView = true
    }
}
