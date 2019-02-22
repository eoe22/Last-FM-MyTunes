//
//  LoginViewModel.swift
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 2/5/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

import Foundation

class LoginViewModel{
    
    enum State{
        case initial
        case authenticated
        case invalid
    }

    //closure to call whenever the state changes
    var stateChanged: ((State) -> ())?
    
    //state of the scene - by default, nothing has happened
    var state: State = .initial{
        didSet{
            //call this function whenever the state changes
            stateChanged?(state)
        }
    }
    
    /**
     Login to the server
    */
    func login(username: String, password: String){
        
//        AuthenticationService.shared.authenticate(username: username, password: password)
        
        //mimic connecting to server for XCUITesting
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0){
            if username == password{
                self.state = .authenticated
            }
            else{
                self.state = .invalid
            }
        }
    }
}
