//
//  SendMessagePresenter.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import Foundation

class SendMessagePresenter {
    var interactor: SendMessageInteractor!
    var routing: DesafioRouter!
    
    func goToVerification() {
        routing.goToVericationMessage()
    }
    
    func sendMessage(phone: String) {
        interactor.sendMessage(phone: phone)
    }
    
}
