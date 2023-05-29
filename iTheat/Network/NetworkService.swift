//
//  NetworkService.swift
//  iTheat
//
//  Created by Samy Mehdid on 29/5/2023.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    
    private let headers : HTTPHeaders = [
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWExYWU2NDAwNTk5YjM1YzY3ZDc4ZjJjMGQxOTg5ZSIsInN1YiI6IjY0NzMyYTkxNWNkMTZlMDEzM2UxZDBkZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._v-hUAP7un6AGszzL06Oqr_eN-eJv4Hz3o3XPao-d1g",
        "accept": "Application/json"
    ]
    
    private let session = Session()
    private let url = "https://api.themoviedb.org/3"
    
    /// used to get data from an api.
    func get<Model: Decodable>(endpoint: String, query: [String: Any]? = nil, success: @escaping (Model) -> Void, failure: @escaping (ErrorResponse?) -> Void){
        debugPrint("http:url: \(url)\(endpoint)")
        
        session.request("\(url)\(endpoint)", method: .get, parameters: query, encoding: URLEncoding.default, headers: headers)
        .validate()
        .responseDecodable(of: Model.self) { response in
            debugPrint("http:res: \(response.debugDescription)")
            guard let status = response.response?.statusCode else {
                failure(ErrorResponse(code: 0, message: "somthing_went_wrong".localized))
                return
            }
            switch status {
            case 200...299:
                switch response.result {
                case .success(let res):
                    success(res)
                case .failure(let error):
                    failure(ErrorResponse(code: 0, message: error.errorDescription ?? ""))
                }
            case 400...499:
                guard let error = try? JSONDecoder().decode(ErrorResponse.self, from: response.data!) else {
                    failure(ErrorResponse(code: 0, message: "somthing_went_wrong".localized))
                    return
                }
                failure(error)
                
            default: failure(ErrorResponse(code: 0, message: "somthing_went_wrong".localized))
            }
        }
    }
    
    /// used to post data to an api.
    func post<Model: Decodable>(endpoint: String, body: [String: Any], success: @escaping (Model) -> Void, failure: @escaping (ErrorResponse?) -> Void){
        debugPrint("http:url: \(url)\(endpoint)")
        debugPrint("http:body: \(body)")
        
        session.request("\(url)\(endpoint)", method: .post, parameters: body, headers: headers)
            .responseDecodable(of: Model.self, emptyResponseCodes: [200]) { response in
            
            debugPrint("http:res: \(response.debugDescription)")
            
            guard let status = response.response?.statusCode else {
                failure(ErrorResponse(code: 0, message: "somthing_went_wrong".localized))
                return
            }
            
            switch status {
            case 200...299:
                switch response.result {
                case .success(let res):
                    success(res)
                case .failure(let error):
                    failure(ErrorResponse(code: 0, message: error.errorDescription ?? ""))
                }
            case 400...499:
                guard let error = try? JSONDecoder().decode(ErrorResponse.self, from: response.data!) else {
                    failure(ErrorResponse(code: 0, message: "somthing_went_wrong".localized))
                    return
                }
                failure(error)
            default: failure(ErrorResponse(code: 0, message: "somthing_went_wrong".localized))
            }
        }
    }
}
