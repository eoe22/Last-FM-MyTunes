//
//  LoginViewController.swift
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 2/4/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        viewModel.stateChanged = { state in
            self.handleState(state: state)
        }
    }
    
    private func handleState(state: LoginViewModel.State){
        switch state{
        case .invalid:
            presentError(title: "Error", message: "Invalid Credentials")
        default:
            presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any){
        guard let username = username.text, let password = password.text
            else{ return }
        
        viewModel.login(username: username, password: password)
    }
    
    @IBAction func exitModal(_ sender: Any){
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

//Can be used by all UIViewControllers
extension UIViewController{
    
    func presentError(title: String, message: String){
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self?.present(alert, animated: true, completion: nil)
        }
    }
}
