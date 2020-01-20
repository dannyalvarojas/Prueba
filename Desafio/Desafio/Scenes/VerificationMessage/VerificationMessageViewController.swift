//
//  VerificationMessageViewController.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit

class VerificationMessageViewController: UIViewController {
    
    @IBOutlet weak var verificationText :UITextField!
    @IBOutlet weak var validateButton :UIButton!
    var verificationID :String!
    var code: String!
    
    var presenter: VerificationMessagePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension VerificationMessageViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return "Login"
    }
}
