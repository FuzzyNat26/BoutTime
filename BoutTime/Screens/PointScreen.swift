//
//  PointScreen.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct PointScreen: View {
    // COLOR ENVIRONMENT (LIGHT MODE DARK MODE)
    @Environment(\.colorScheme) var colorScheme
    
    // APPSTORAGE
//    @AppStorage("UserColorKey") var colorKey: Int = 0
    @AppStorage("UserName") var userName: String = "User"
    
    // CONTEXT
    @FetchRequest(
        entity: PriorityItem.entity(),
        sortDescriptors: []
    )
    
    // PRIORITY OBJECTS (PRIORITY COLLECTIONS)
    private var priorities: FetchedResults<PriorityItem>
    
    // ICON NAME
    @AppStorage("UserIcon") var iconName: String = "leaf.fill"
    
    // VARIABLES
    @State private var totalSelesai: Int = 0;
    @State private var totalBelumSelesai: Int = 0;
    @State private var totalPoin: Int = 0;
    
//    @StateObject var levelObserver = LevelObserver()
    @EnvironmentObject var levelObserver: LevelObserver
    
    @State private var startFrom: Int = 0;
    @State private var endFrom: Int = 100;
    
    func setStartEnd() {
        // [levelUser, startFrom, endFrom] : <Int>
        let result = hitungLevelUser(totalPoin: totalPoin)
        
        startFrom = result[1]
        endFrom = result[2]
        
        let levelUser = result[0]
        levelObserver.setLevel(level: levelUser)
    }
    
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
                List {
                    Section(
                        header:
                            HStack(alignment: .center) {
                                VStack(alignment: .center, spacing: 8) {
                                    ProgressBarView(
                                        levelUser: levelObserver.levelUser,
                                        totalPoin: totalPoin,
                                        startFrom: startFrom,
                                        endFrom: endFrom,
                                        colorKey: levelObserver.colorKey,
                                        iconName: profileIconList[levelObserver.levelUser - 1]
                                    )
                                    
                                    Text("\(userName) - Level \(levelObserver.levelUser)")
                                        .font(.headline)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(1)
                                        .textCase(nil)
                                    Text("\(thousandSeperators(points: totalPoin)) Pts")
                                        .bold()
                                        .font(.title)
                                        .foregroundColor(colorConstants[levelObserver.colorKey])
                                        .multilineTextAlignment(.trailing)
                                }
                                .padding(.vertical)
                                .frame(minWidth: 0, maxWidth: .infinity)
                            }
                    ) {
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
                                    ? round(Float(totalPoin) / Float(totalSelesai) * 100) / 100
                                    : Float(0)
                                )
                            )
                            .foregroundColor(.gray);
                        }
                    }
                }
                .onAppear(perform: {
                    UITableView.appearance().contentInset.top = -25
                }
                )
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Edit") {
                            showEditSheetView = true;
                        }
                    }
                }.listStyle(InsetGroupedListStyle())
            }
            
            .background(colorScheme == .light ? Color(UIColor.secondarySystemBackground) : Color(UIColor.black))
            .navigationBarTitle(Text("Poin"))
            .sheet(isPresented: $showEditSheetView) {
                EditPointSheetView(
                    showSheetView: $showEditSheetView,
                    nama: userName,
//                    selectedColorKey: colorKey,
//                    selectedIcon: iconName,
                    levelUser: levelObserver.levelUser
                )
            }
        }.onAppear{
            sumTotalPoin()
            setStartEnd()
            
            countTotalBelumSelesai()
            countTotalSelesai()
        }
    }
}

struct PointScreen_Previews: PreviewProvider {
    static var previews: some View {
        PointScreen()
    }
}
