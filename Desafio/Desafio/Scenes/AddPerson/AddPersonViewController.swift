//
//  AddPersonViewController.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var presenter: AddPersonPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        initDatePicker()
    }
    
    // MARK: - Own Methods
    func initDatePicker() {
        let calendar = Calendar(identifier: .gregorian)
        var comps = DateComponents()
        comps.year = -20
        let maxDate = calendar.date(byAdding: comps, to: Date())
        comps.year = -100
        let minDate = calendar.date(byAdding: comps, to: Date())
        
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.maximumDate = maxDate
        datePickerView.minimumDate = minDate
            self.birthdayText.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(handleDatePicker(_:)), for: UIControl.Event.valueChanged)
    }
    
    @objc func doneKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func handleDatePicker(_ sender: Any) {
        let datePickerView  = sender as! UIDatePicker
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.birthdayText.text = dateFormatter.string(from: datePickerView.date)
    }
    
    // MARK: - IBActions
    @IBAction func saveUser(sender: UIButton) {
        guard let name = self.nameText.text,
            let lastName = self.lastNameText.text,
            let age = self.ageText.text,
            let birthday = self.birthdayText.text else {
                return
        }
        let user = Person(name: name, lastName: lastName, age: age, birthday: birthday)
        presenter.savePerson(person: user)
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

extension AddPersonViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return "Main"
    }
    
    
}
