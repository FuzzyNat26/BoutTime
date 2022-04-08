//
//  WelcomeScreen.swift
//  BoutTime
//
//  Created by Jonathan Lee on 08/04/22.
//

import SwiftUI

struct WelcomeScreen: View {
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            VStack(alignment: .leading) {
                Text("Selamat datang di")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("BoutTime")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                Text("Aplikasi pencatatan prioritas dengan gamifikasi guna meningkatkan motivasi dan kedisiplinan.")
                    .padding(.top, 1)
            }
            .frame(minWidth:0,  maxWidth: .infinity)
            VStack(alignment: .leading, spacing: 30) {
                
                ItemList(
                    systemName: "checklist",
                    color: .red,
                    textHeadline: "Catat Prioritas",
                    textSubheadline: "Anda bisa catat, ubah, dan hapus prioritas tergantung kebutuhan.",
                    height: 37
                )
                ItemList(
                    systemName: "arrow.up.arrow.down.circle.fill",
                    color: .orange,
                    textHeadline: "Urutkan Prioritas",
                    textSubheadline: "Prioritas bisa diurutkan berdasarkan preferensi anda."
                )
                
                ItemList(
                    systemName: "dpad.up.filled",
                    color: .yellow,
                    textHeadline: "Sistem Level",
                    textSubheadline: "Dapatkan poin untuk naik level setelah prioritas selesai dilakukan."
                )
            }
            
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                UserDefaults.standard.set(false, forKey: "firstTimeOpenTheApp")
            }) {
                Text("Lanjutkan")
                    .padding(.horizontal)
                    .padding(.vertical, 8.0)
                    .frame(minWidth:0,  maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding(.horizontal, 45)
        .frame(minHeight: 0, maxHeight: .infinity)
        .padding(.vertical, 50)
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}

struct ItemList:View {
    var systemName: String;
    var color: Color;
    var textHeadline: String;
    var textSubheadline: String
    var height: Int = 40
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: self.systemName)
                .resizable()
                .frame(width: 40, height: CGFloat(self.height))
                .foregroundColor(self.color)
            VStack(alignment: .leading, spacing: 2) {
                Text("\(self.textHeadline)")
                    .font(.headline)
                Text("\(self.textSubheadline)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
