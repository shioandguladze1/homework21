//
//  CountryTableViewCell.swift
//  HomeWork21(shio andghuladze)
//
//  Created by shio andghuladze on 11.08.22.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(name: String){
        nameLabel.text = name
    }
    
}
