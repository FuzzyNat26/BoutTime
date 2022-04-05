//
//  PointScreen.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct PointScreen: View {
    // APPSTORAGE
    @AppStorage("UserColorKey") var colorKey: Int = 0
    @AppStorage("UserName") var userName: String = "User"
    
    // CONTEXT
    @FetchRequest(
        entity: PriorityItem.entity(),
        sortDescriptors: []
    )
    
    // PRIORITY OBJECTS (PRIORITY COLLECTIONS)
    private var priorities: FetchedResults<PriorityItem>
    
    // ICON NAME
//    let iconName: String = "star.fill";
    @AppStorage("UserIcon") var iconName: String = "star.fill"
    
    // VARIABLES
    @State var totalSelesai: Int = 0;
    @State var totalBelumSelesai: Int = 0;
    @State var totalPoin: Int = 0;
    
    func sumTotalPoin(){
        totalPoin = priorities.filter{
            $0.priorityIsChecked == true
        }.reduce(0){
            $0 + Int($1.priorityPoint)
        }
    }
    func countTotalBelumSelesai(){
        totalBelumSelesai = priorities.filter{
            $0.priorityIsChecked == false
        }.count
    }
    
    func countTotalSelesai() {
        totalSelesai = priorities.filter{
            $0.priorityIsChecked == true
        }.count
        
    }
    
    // SHEET STATE
    @State var showEditSheetView: Bool = false;
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    HStack(alignment: .center) {
                        ZStack {
                            Circle()
                                .fill(
                                    RadialGradient(
                                        gradient: Gradient(
                                            colors: [
                                                colorConstants[colorKey] ?? .black,
                                                .white]),
                                        center: .bottom,
                                        startRadius: 1,
                                        endRadius: 200
                                    )
                                )
                                .frame(width: 80, height: 80)
                            Image(systemName: iconName)
                                .font(.system(size: 35))
                                .foregroundColor(.white)
                        }
                        .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text("\(thousandSeperators(points: totalPoin)) Pts")
                                .bold()
                                .font(.title)
                                .foregroundColor(colorConstants[colorKey])
                                .multilineTextAlignment(.trailing)
                            Text(userName)
                                .font(.title3)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(1)
                        }
                        .padding(.leading)
                    }.padding(.vertical, 15.0)
                    
                    Section {
                        HStack {
                            Text("Total Selesai");
                            Spacer()
                            Text(String(totalSelesai)).foregroundColor(.gray)
                        }
                        HStack {
                            Text("Total Belum Selesai")
                            Spacer()
                            Text(String(totalBelumSelesai)).foregroundColor(.gray);
                        }
                        HStack {
                            Text("Poin Rata-Rata")
                            Spacer()
                            Text(
                                String(
                                    totalSelesai != 0
                                    ? Float(totalPoin) / Float(totalSelesai)
                                    : Float(0)
                                )
                            )
                            .foregroundColor(.gray);
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Edit") {
                            showEditSheetView = true;
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Poin"))
            .sheet(isPresented: $showEditSheetView) {
                EditPointSheetView(
                    showSheetView: $showEditSheetView,
                    nama: userName,
                    selectedColorKey: colorKey,
                    selectedIcon: iconName
                )
            }.onAppear{
                sumTotalPoin()
                countTotalBelumSelesai()
                countTotalSelesai()
            }
        }
    }
}

struct PointScreen_Previews: PreviewProvider {
    static var previews: some View {
        PointScreen()
    }
}
