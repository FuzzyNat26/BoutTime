//
//  EditPrioritySheetView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct EditPrioritySheetView: View {
    // CONTEXT AND PRESENTATION MODE
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    // PRIORITY ITEM
    var priorityItem: PriorityItem;
    
    // URGENCY INDEX
    @State var urgencyLevelIndex: Int;
    
    // SHOW SHEET BINDING
    @Binding var showSheetView: Bool;
    
    // VARIABLES
    @State var namaPrioritas: String;
    @State var tingkatUrgensi: String;
    @State var tanggalSelesai = Date.now;
    @State var poinSelesai: Int = 1;
    
    func stepperCountRestrictions(_ inputUrgencyLevel: String, _ onSheetAppear: Bool = false) {
        let index = daftarTingkatUrgensi.firstIndex(of: inputUrgencyLevel);
        urgencyLevelIndex = (index ?? 0)!
        
        if(!onSheetAppear) {
            poinSelesai = (index ?? 0)! * 2 + 1;
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Masukkan nama prioritasmu", text: $namaPrioritas)
                            .modifier(TextClearField(text: $namaPrioritas))
                    }
                    
                    Section {
                        DatePicker(
                            "Tanggal Selesai",
                            selection: $tanggalSelesai,
                            displayedComponents: [.date]
                        )
                        
                        Picker(
                            "Tingkat Urgensi",
                            selection: $tingkatUrgensi
                        )
                        {
                            ForEach(daftarTingkatUrgensi, id: \.self)
                            {
                                Text($0)
                            }
                        }.onChange(of: tingkatUrgensi) {
                            tag in
                            stepperCountRestrictions(tag)
                        }
                        Stepper(value: $poinSelesai, in: priorityPoint[urgencyLevelIndex])
                        {
                            HStack {
                                Text("Poin")
                                Spacer()
                                Text("\(poinSelesai)")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 2.0);
                            }
                        }
                        
                    }
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text("Ubah Prioritas"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        updatePriority()
                        self.presentationMode.wrappedValue.dismiss()
                    }.disabled(namaPrioritas.trimmingLeadingAndTrailingSpaces().isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Batalkan") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }.onAppear{
            stepperCountRestrictions(tingkatUrgensi, true)
        }
    }
    
    func updatePriority() {
        guard self.namaPrioritas != "" else {return}
        
        viewContext.performAndWait {
            priorityItem.priorityFinishedDate    = tanggalSelesai
            priorityItem.priorityIsChecked       = false
            priorityItem.priorityPoint           = Int32(poinSelesai)
            priorityItem.priorityTitle           = namaPrioritas
            priorityItem.priorityUrgencyLevel    = tingkatUrgensi
            try? viewContext.save()
        }
    }
}
