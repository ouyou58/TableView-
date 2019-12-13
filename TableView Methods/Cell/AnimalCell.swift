//
//  AnimalCell.swift
//  TableView Methods
//
//  Created by ouyou on 2019/12/11.
//  Copyright © 2019 ouyou. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
