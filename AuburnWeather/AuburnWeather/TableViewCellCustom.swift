//
//  TableViewCellCustom.swift
//  AuburnWeather
//
//  Created by Zach Chandler on 6/18/15.
//  Copyright (c) 2015 Zach Chandler. All rights reserved.
//

import UIKit

class TableViewCellCustom: UITableViewCell {

    @IBOutlet weak var CellImage: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Discription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
