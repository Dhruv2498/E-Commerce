//
//  MYSubCategoryTableViewCell.swift
//  CategoryListApi
//
//  Created by Apple on 02/08/23.
//

import UIKit

class MYSubCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblsubcategoryid: UILabel!
    
    @IBOutlet weak var lblsubcategoryname: UILabel!

     @IBOutlet weak var lblcatid: UILabel!
    
    @IBOutlet weak var subcatimageview: UIImageView!
    @IBOutlet weak var lblcatname: UILabel!
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
            lblsubcategoryid.isHidden = true
            lblcatid.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
