//
//  CardDetailView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

struct CardDetailView: View {
    // VARIABLES
    public var priorityTitle: String;
    public var priorityDate: Date;
    public var priorityUrgencyLevel: String;
    
    // ISCHECKBINDING
    @Binding public var isChecked: Bool;
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(priorityTitle)
                .lineLimit(1)
                .foregroundColor(isChecked == true ? .secondary : .primary)
            Text("\(priorityUrgencyLevel) - \(priorityDate, style: .date)")
                .lineLimit(1)
                .font(.caption)
                .foregroundColor(Color.gray)
        }
    }
}
