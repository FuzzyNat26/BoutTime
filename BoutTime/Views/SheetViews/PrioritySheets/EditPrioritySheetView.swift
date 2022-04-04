//
//  EditPrioritySheetView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct EditPrioritySheetView: View {
    @State var urgencyLevelIndex: Int;
   
    // Sheets state
    @Binding var showSheetView: Bool;

    // User input variable state
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
                            "Tanggal",
                            selection: $tanggalSelesai,
                            displayedComponents: [.date]
                        )
                        
                        Picker(
                            "Tingkat urgensi",
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
                        
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showSheetView = false;
                    }
                }
            }
        }.onAppear{
            stepperCountRestrictions(tingkatUrgensi, true)
        }
    }
}

//struct EditPrioritySheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPrioritySheetView()
//    }
//}
