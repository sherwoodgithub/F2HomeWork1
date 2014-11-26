//
//  TableViewCell.swift
//  F2HomeWork1
//
//  Created by Stephen on 11/25/14.
//  Copyright (c) 2014 Sherwood. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell
{
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var subName: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
