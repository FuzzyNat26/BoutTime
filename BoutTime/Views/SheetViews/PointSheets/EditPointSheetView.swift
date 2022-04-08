//
//  EditPointSheetView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct EditPointSheetView: View {
    // SHOW SHEET BINDING
    @Binding var showSheetView: Bool;
    
    // VARIABLES
    @State var nama: String;
    @State var selectedColorKey: Int;
    
    var levelUser: Int;
    
    // SAVE PAGE INFORMATION TO USER DEFAULTS
    func saveProfile() {
        UserDefaults.standard.set(nama, forKey: "UserName");
        UserDefaults.standard.set(selectedColorKey, forKey: "UserColorKey")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField(
                            "Masukkan nama",
                            text: $nama
                        ).modifier(TextClearField(text: $nama))
                    }
                    
                    Section("Warna kotak centang (checkbox)") {
                        VStack(alignment: .center) {
                            HStack(alignment: .center) {
                                ColorPickerView(selectedColorKey: $selectedColorKey, levelUser: levelUser)
                            }
                        }
                        .padding(.vertical, 2.0)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text("Ubah Preferensi"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Selesai") {
                        saveProfile()
                        showSheetView = false;
                    }.disabled(nama.trimmingLeadingAndTrailingSpaces().isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Batalkan") {
                        showSheetView = false;
                    }
                }
            }
        }
    }
}
