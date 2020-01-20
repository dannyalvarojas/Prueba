//
//  DetailPeopleViewController.swift
//  Desafio
//
//  Created by Danny Alva on 1/19/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit

class DetailPeopleViewController: UIViewController {
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var heightLabel:UILabel!
    @IBOutlet weak var massLabel:UILabel!
    @IBOutlet weak var hairColorLabel:UILabel!
    @IBOutlet weak var skinColorLabel:UILabel!
    @IBOutlet weak var birthYearLabel:UILabel!
    @IBOutlet weak var genderLabel:UILabel!
    
    var presenter: DetailPeoplePresenter!
    var people: results?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Own Methods
    
    func loadData() {
        nameLabel.text = people?.name
        heightLabel.text = people?.height
        massLabel.text = people?.mass
        hairColorLabel.text = people?.hair_color
        skinColorLabel.text = people?.skin_color
        birthYearLabel.text = people?.birth_year
        genderLabel.text = people?.gender
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

extension DetailPeopleViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return "Main"
    }
    
    
}
