//
//  PointView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct PointView: View {
    // ISCHECK
    @Binding public var isChecked: Bool;
    
    // PRIORITY POINT
    var priorityPoint: Int = 9;
    
    public var body: some View {
        // JIKA BUKAN 10, TAMBAHKAN 0 DI DEPAN
        
        // TODO: PISAHKAN DAN TAMBAHKAN PTS
        Text(priorityPoint != 10 ? "0\(priorityPoint)Pts": "\(priorityPoint)Pts")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(isChecked ? .gray : .red)
            .multilineTextAlignment(.trailing)
    }
}
