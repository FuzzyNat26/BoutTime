//
//  AddPrioritySheetView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct AddPrioritySheetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var urgencyLevelIndex: Int = 0;
   
    // Sheets state
    @Binding var showSheetView: Bool;

    // User input variable state
    @State var namaPrioritas: String = "";
    @State var tingkatUrgensi: String = daftarTingkatUrgensi[0];
    @State var tanggalSelesai = Date.now;
    @State var poinSelesai: Int = 1;
    
    func stepperCountRestrictions(_ inputUrgencyLevel: String) {
        let index = daftarTingkatUrgensi.firstIndex(of: inputUrgencyLevel);
        urgencyLevelIndex = (index ?? 0)!
        poinSelesai = (index ?? 0)! * 2 + 1;
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
            .navigationBarTitle(Text("Tambah Prioritas"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addPriority();
                        showSheetView = false;
                    }.disabled(namaPrioritas.trimmingLeadingAndTrailingSpaces().isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showSheetView = false;
                    }
                }
            }
        }
    }
    
    func addPriority() {
        guard self.namaPrioritas != "" else {return}
        
        let newPriority = PriorityItem(context: viewContext)
        newPriority.priorityCreatedDate     = Date.now
        newPriority.priorityFinishedDate    = tanggalSelesai
        newPriority.priorityIsChecked       = false
        newPriority.priorityPoint           = Int32(poinSelesai)
        newPriority.priorityTitle           = namaPrioritas
        newPriority.priorityUrgencyLevel    = tingkatUrgensi
        newPriority.priorityId = UUID()

        do {
            try viewContext.save()
            print("Priorty saved.")
            presentationMode.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
}

//struct AddPrioritySheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPrioritySheetView()
//    }
//}
