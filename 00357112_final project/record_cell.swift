//
//  record_cell.swift
//  00357112_final project
//
//  Created by user_14 on 2017/6/20.
//  Copyright © 2017年 Elrick. All rights reserved.
//

import UIKit

class record_cell: UITableViewCell {
    @IBOutlet weak var b_count: UILabel!
    @IBOutlet weak var a_count: UILabel!
    @IBOutlet weak var input_number: UILabel!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
