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
    @AppStorage("UserIcon") var iconName: String = "star.fill"
    
    // VARIABLES
    @State private var totalSelesai: Int = 0;
    @State private var totalBelumSelesai: Int = 0;
    @State private var totalPoin: Int = 0;
    @State private var levelUser: Int = 1;
    
    @State private var startFrom: Int = 0;
    @State private var endFrom: Int = 100;
    
    func setStartEnd() {
        let result = hitungLevelUser(totalPoin: totalPoin)
        print(result)
        
        levelUser = result[0]
        print(levelUser)
        
        startFrom = result[1]
        endFrom = result[2]
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
                                        levelUser: $levelUser,
                                        totalPoin: totalPoin,
                                        startFrom: startFrom,
                                        endFrom: endFrom,
                                        colorKey: colorKey,
                                        iconName: iconName
                                    ).padding(.bottom)
                                    
                                    Text("\(userName) - Level \(levelUser)")
                                        .font(.title3)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(1)
                                    Text("\(thousandSeperators(points: totalPoin)) Pts")
                                        .bold()
                                        .font(.title)
                                        .foregroundColor(colorConstants[colorKey])
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
                                    ? Float(totalPoin) / Float(totalSelesai)
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
//            .navigationBarTitle(Text("Poin"))
            .navigationBarTitle(Text("\(levelUser)"))
            .sheet(isPresented: $showEditSheetView) {
                EditPointSheetView(
                    showSheetView: $showEditSheetView,
                    nama: userName,
                    selectedColorKey: colorKey,
                    selectedIcon: iconName,
                    levelUser: levelUser
                )
            }
        }.onAppear{
            print("Current", levelUser)
            sumTotalPoin()
            setStartEnd()
            
            print("After", levelUser)
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
