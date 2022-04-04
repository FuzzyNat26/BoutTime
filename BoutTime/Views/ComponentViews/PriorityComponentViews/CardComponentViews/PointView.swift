//
//  PointView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct PointView: View {
    @Binding public var isChecked: Bool;
    var priorityPoint: Int = 9;
    
    public var body: some View {
        Text(priorityPoint < 10 ? "0\(priorityPoint)Pts": "\(priorityPoint)Pts")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(isChecked ? .gray : .red)
            .multilineTextAlignment(.trailing)
    }
}

//struct PointView_Previews: PreviewProvider {
//    static var previews: some View {
//        PointView()
//    }
//}
