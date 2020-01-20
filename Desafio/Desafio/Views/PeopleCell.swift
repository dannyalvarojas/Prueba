//
//  PeopleCell.swift
//  Desafio
//
//  Created by Danny Alva on 1/19/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit

class PeopleCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(data: results) {
        nameLabel.text = data.name
    }

}
