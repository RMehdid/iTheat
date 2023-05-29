//
//  Error.swift
//  iTheat
//
//  Created by Samy Mehdid on 29/5/2023.
//

import Foundation

struct ErrorResponse: Decodable {
    let code: Int
    let message: String
}
