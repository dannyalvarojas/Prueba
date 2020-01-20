//
//  UserCell.swift
//  Desfio Intercorp
//
//  Created by Danny Alva on 8/7/19.
//  Copyright © 2019 Danny Alva. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadData(user:Person) {
        self.userNameLabel.text = user.fullName()
        self.birthdayLabel.text = user.birthday! + " (" + user.age! + " años)"
    }

}
