//
//  API.swift
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 2/5/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

import Foundation
import CryptoSwift

struct API {
    
    static let base = "https://ws.audioscrobbler.com/2.0/?method="
    
    static let key = "666ec342286977fbceef97f221aed827"
    static let secret = "39b0bd04106ee12d55590108e04585dd"
    
    static func signature(user: String, pass: String) -> String? {
        let sig = "\(key)xxxxxxxxmethodauth.getMobileSession" +
        "\(pass)xxxxxxx\(user)xxxxxxxx\(secret)"
        
        return sig.md5()
    }
    
    static func authURL() -> String {
        return base + "auth.getMobileSession"
    }
}
