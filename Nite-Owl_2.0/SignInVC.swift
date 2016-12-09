//
//  SignInVC.swift
//  Nite-Owl_2.0
//
//  Created by Jordan Cech on 12/7/16.
//  Copyright © 2016 Jordan Cech. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

import FacebookLogin
import FacebookCore

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
//-----------------------------------------------------------------

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let loginManager = LoginManager()
        loginManager.logIn([ ReadPermission.publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login to Facebook.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in to Facebook!")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
                self.firebaseAuth(credential)
            }
        }
}
  
//-----------------------------------------------------------------
    
    // 2. Authenticate with Firebase.
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("JAY: Unable to authenticate with Firebase.")
            
            }else {
                print("JAY: Successfully authenticated w/ Firebase!")
            }
        })
    }
//-----------------------------------------------------------------
}
