//
//  SendMessageViewController.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit

class SendMessageViewController: UIViewController {
    
    @IBOutlet weak var phoneTextField : UITextField!
    @IBOutlet weak var sendButton : UIButton!
    var phoneNumber:String!
    var verificationCode:String!
    
    var presenter: SendMessagePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    
    @IBAction func sendButtonPressed(sender: UIButton) {
        presenter.sendMessage(phone: phoneTextField.text!)
    }
    
    
    // MARK: - TouchesInteraction
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

extension SendMessageViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return "Login"
    }
}
