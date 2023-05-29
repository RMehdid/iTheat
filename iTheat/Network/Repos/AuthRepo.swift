//
//  AuthRepo.swift
//  iTheat
//
//  Created by Samy Mehdid on 29/5/2023.
//

import Foundation

class AuthRepo: NetworkService {
    
    static let sharedAuth = AuthRepo()
    
    private enum Urls: String {
        case createRequestToken = "/authentication/token/new"
        case validaToken = "/authentication"
        case createSessionID = "/authentication/session/new"
        case createGuestSession = "/authentication/guest_session/new"
    }
    
    static func createGuestSessionID(success: @escaping (GuestSession) -> Void, failure: @escaping (ErrorResponse?) -> Void) {
        shared.get(endpoint: Urls.createGuestSession.rawValue, success: success, failure: failure)
    }
}
