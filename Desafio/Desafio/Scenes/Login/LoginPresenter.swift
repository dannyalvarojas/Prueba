//
//  LoginPresenter.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import Foundation
import UIKit

class LoginPresenter {
    
    var interactor: LoginInteractor!
    var routing: DesafioRouter!
    
    func navigateToPhoneMessage() {
        routing.goToSendMessage()
    }
    
    func navigateToHome() {
        routing.goToHome()
    }
    
}
