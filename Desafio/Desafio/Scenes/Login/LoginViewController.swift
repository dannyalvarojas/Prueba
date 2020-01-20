//
//  LoginViewController.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var facebookView: UIView!
    
    var presenter: LoginPresenter!
    var routing: DesafioRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
        addFacebookButton()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Own Methods
    func addFacebookButton() {
        self.facebookView.layoutIfNeeded()
        let facebookButton = FBLoginButton.init()
        facebookButton.delegate = self
        facebookButton.center = CGPoint(x: self.facebookView.frame.size.width/2, y: self.facebookView.frame.size.height/2)
        self.facebookView.addSubview(facebookButton)
        self.facebookView.layer.cornerRadius = 5.0
    }
    
    // MARK: - IBActions
    @IBAction func phoneButtonPressed(sender:UIButton) {
        presenter.navigateToPhoneMessage()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        facebookView.isHidden = true
        if let error = error {
            print(error.localizedDescription)
            return;
        }
        
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current?.tokenString ?? "")
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            UserDefaults.standard.set(AccessToken.current?.tokenString, forKey: "accessToken")
            self.presenter.navigateToHome()
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
    
}

extension LoginViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return "Login"
    }
}
