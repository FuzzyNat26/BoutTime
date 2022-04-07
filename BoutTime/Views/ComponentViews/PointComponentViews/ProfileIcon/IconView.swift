//
//  IconView.swift
//  BoutTime
//
//  Created by Jonathan Lee on 06/04/22.
//

import SwiftUI

struct IconView: View {
    var colorKey: Int
    var iconName: String
    
    var body: some View {
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
                .frame(width: 76, height: 76)
            Image(systemName: iconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
        }
        .clipShape(Circle())
    }
}
