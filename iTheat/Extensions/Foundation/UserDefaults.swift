//
//  UserDefaults.swift
//  iTheat
//
//  Created by Samy Mehdid on 29/5/2023.
//

import Foundation

fileprivate protocol ObjectSaveable {
    func setObject<Object>(_ object: Object, forKey key: String) where Object: Encodable
    func getObject<Object>(forKey: String, fallback: ()->Object) -> Object where Object: Decodable
}

extension UserDefaults: ObjectSaveable {
    func setObject<Object>(_ object: Object, forKey key: String) where Object: Encodable {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(object) {
            set(data, forKey: key)
        } else {
            print("Could not store object with key(\(key) in the user defaults")
        }
    }
    
    func getObject<Object>(forKey: String, fallback: ()->Object) -> Object where Object: Decodable {
        guard let data = data(forKey: forKey) else { return fallback() }
        let decoder = JSONDecoder()
        
        do {
            let object = try decoder.decode(Object.self, from: data)
            return object
        } catch {
            print("Catched \(error) while parse object from user defaults")
            return fallback()
        }
    }
    
    func getObject<Object>(forKey: String) -> Object? where Object: Decodable {
        guard let data = data(forKey: forKey) else { return nil }
        let decoder = JSONDecoder()
        
        do {
            let object = try decoder.decode(Object.self, from: data)
            return object
        } catch {
            print("Catched \(error) while parse object from user defaults")
            return nil
        }
    }
    
    dynamic var accessToken: String? {
        get { string(forKey: "access_token") }
        set { setValue(newValue, forKey: "access_token") }
    }
    
    dynamic var sessionId: String? {
        get { string(forKey: "session_id") }
        set { setValue(newValue, forKey: "session_id") }
    }
}
