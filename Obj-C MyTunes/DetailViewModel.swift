//
//  DetailViewModel.swift
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 2/1/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

import Foundation

class DetailViewModel{
    
    //various states
    enum State{
        case noContent
        case album(Album)
    }
    
    //function/CLOSURE to call whenever the state changes
    var stateChanged: ((State) -> ())?
    //state of the scene - by default is no content
    var state: State = .noContent {
        didSet{
            //call this function whenever the state changes
            stateChanged?(state)
        }
    }
    
    func show(content: Album){
        state = .album(content)
    }
    
    func process(sender: AnyObject?){
        guard let data = sender else{
                //if no data was passed, dont show anything
                state = .noContent
                return
        }
        
        if let content = data as? Album{
            show(content: content)
        }
    }
}
