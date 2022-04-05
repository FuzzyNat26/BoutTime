//
//  Transition.swift
//  BoutTime
//
//  Created by Jonathan Lee on 05/04/22.
//

import SwiftUI

extension AnyTransition {
    static var backSlide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)
        )
    }
}
