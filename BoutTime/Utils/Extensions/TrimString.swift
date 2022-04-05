//
//  TrimString.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import Foundation

extension String {
    func trimmingLeadingAndTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return trimmingCharacters(in: characterSet)
    }
}
