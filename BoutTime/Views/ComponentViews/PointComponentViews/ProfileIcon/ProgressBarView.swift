//
//  ProgressBarView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 07/04/22.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var levelUser: Int

    var totalPoin: Int
    var startFrom: Int
    var endFrom: Int
    
    var colorKey: Int
    var iconName: String
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 13)
                    .opacity(0.2)
                    .frame(width: 100, height: 100)
                
                Circle()
                    .trim(
                        from: 0.0,
                        to: CGFloat(
                            Float(
                                totalPoin.converting(from: startFrom...endFrom, to: 0...100)) / Float(100)
                        )
                    )
                    .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(colorConstants[colorKey] ?? .red)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: 270))
                
            }
            IconView(colorKey: colorKey, iconName: iconName)
        }
        .onAppear() {
            levelUser = totalPoin / 100 + 1
        }
    }
}

//struct ProgressBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBarView()
//    }
//}
