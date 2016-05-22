//
//  BurritoTableViewCell.swift
//  burritoMe
//
//  Created by David Goodman on 5/21/16.
//  Copyright © 2016 David Goodman. All rights reserved.
//

import UIKit

class BurritoTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dist: UITextField!
    @IBOutlet weak var loc: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
