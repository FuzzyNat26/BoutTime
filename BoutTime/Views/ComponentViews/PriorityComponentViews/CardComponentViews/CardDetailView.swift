//
//  CardDetailView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct CardDetailView: View {
    public var priorityTitle: String;
    public var priorityDate: Date;
    public var priorityUrgencyLevel: String;
    @Binding public var isChecked: Bool;
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(priorityTitle)
                .lineLimit(1)
                .foregroundColor(isChecked == true ? .secondary : .primary)
            Text("\(priorityUrgencyLevel) - \(priorityDate, style: .date)")
                .font(.caption)
                .foregroundColor(Color.gray)
        }
    }
}

//struct CardDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardDetailView()
//    }
//}
