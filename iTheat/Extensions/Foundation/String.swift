//
//  String.swift
//  iTheat
//
//  Created by Samy Mehdid on 29/5/2023.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
