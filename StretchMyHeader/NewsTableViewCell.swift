//
//  NewsTableViewCell.swift
//  StretchMyHeader
//
//  Created by Graeme Harrison on 2016-02-16.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var headlineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }

}

