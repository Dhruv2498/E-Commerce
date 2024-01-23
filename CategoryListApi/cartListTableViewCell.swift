//
//  cartListTableViewCell.swift
//  CategoryListApi
//
//  Created by Apple on 29/08/23.
//

import UIKit

class cartListTableViewCell: UITableViewCell {
    @IBOutlet weak var lblcartid: UILabel!
    @IBOutlet weak var lblpid: UILabel!
    @IBOutlet weak var lblpname: UILabel!
    @IBOutlet weak var lblpdetails: UILabel!
    @IBOutlet weak var lblpprice: UILabel!
    @IBOutlet weak var lblpqty: UILabel!
    @IBOutlet weak var pimageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblcartid.isHidden = true
        lblpid.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
