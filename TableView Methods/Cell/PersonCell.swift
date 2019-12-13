//
//  PersonCell.swift
//  TableView Methods
//
//  Created by ouyou on 2019/12/12.
//  Copyright © 2019 ouyou. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
    
    let viewController = ViewController()

    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func didTapBtn(_ sender: Any) {
        viewController.didTapBtn(sender: sender as! UIButton)
    }
    
}
