//
//  SendMessageInteractor.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import Foundation
import Firebase

class SendMessageInteractor {
    
    var verificationCode: String!
    
    func sendMessage(phone:String) {
        let phoneNumber = "+51"+phone
        //Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            
            if let error = error {
                //Utils.init().showAlert(message: error.localizedDescription)
                //return
                print(error.localizedDescription)
            }
            self.verificationCode = verificationID
            print(self.verificationCode ?? "Sin valor")
            //self.performSegue(withIdentifier: "segueVerificationCode", sender: self)
        }
    }
}
