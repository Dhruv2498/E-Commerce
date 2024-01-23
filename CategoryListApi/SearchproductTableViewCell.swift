//
//  SearchproductTableViewCell.swift
//  Pods
//
//  Created by Apple on 21/08/23.
//

import UIKit

class SearchproductTableViewCell: UITableViewCell {
    @IBOutlet weak var lblproid: UILabel!
    @IBOutlet weak var lblproname: UILabel!
    @IBOutlet weak var lblprodetails: UILabel!
    @IBOutlet weak var lblproprice: UILabel!
    @IBOutlet weak var lblproqty: UILabel!
    
    @IBOutlet weak var proimageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblproid.isHidden = true
        lblproqty.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
