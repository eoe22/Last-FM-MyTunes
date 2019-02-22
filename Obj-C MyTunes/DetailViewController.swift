//
//  DetailViewController.swift
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 2/1/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    var subViewController: UIViewController?
    let viewModel = DetailViewModel()
    
    @objc var sender: AnyObject?
    
    override func viewDidLoad() {
        //load initial state
        handle(state: viewModel.state)
        
        //react to later state changes
        viewModel.stateChanged = { state in
            self.handle(state: state)
        }
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        viewModel.process(sender: sender)
    }
    
    private func handle(state: DetailViewModel.State){
        switch state {
        case .noContent:
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
                else{ return }
            
            show(viewController: vc)
            
        case .album(let album):
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "AlbumViewController") as? AlbumViewController
                else{ return }
            
            vc.album = album
            show(viewController: vc)

            break
        }
    }
    
    func show(viewController childVC: UIViewController){
        addChild(childVC)
        childVC.view.frame = view.frame
        view.addSubview(childVC.view)
        
        view.leadingAnchor.constraint(equalTo: childVC.view.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: childVC.view.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: childVC.view.bottomAnchor).isActive = true
        view.topAnchor.constraint(equalTo: childVC.view.topAnchor).isActive = true
    }
}
