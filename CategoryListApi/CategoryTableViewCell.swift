//
//  CategoryTableViewCell.swift
//  CategoryListApi
//
//  Created by Apple on 02/08/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCategoryId: UILabel!
    
    @IBOutlet weak var catimageview: UIImageView!
    @IBOutlet weak var lblCategoryname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblCategoryId.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
