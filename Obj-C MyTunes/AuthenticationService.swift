//
//  AuthenticationService.swift
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 2/6/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

import Foundation

class AuthenticationService {
    
    static let shared = AuthenticationService()
    
    private init() {}
    
    func authenticate(username: String, password: String) {
        
        guard let url = URL(string: API.authURL())
            else { return }
        
        guard let signature = API.signature(user: username, pass: password)
            else { return }
        
        let parameters = ["username": username, "password": password,
                          "api_key": API.key, "api_sig": signature]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        catch let error{
            print(error.localizedDescription)
        }
//        catch {
//            print("\(error.localizedDescription)")
//        }
    }
}
