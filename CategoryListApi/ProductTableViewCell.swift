//
//  ProductTableViewCell.swift
//  CategoryListApi
//
//  Created by Apple on 02/08/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var proimageview: UIImageView!
    @IBOutlet weak var lblproductid: UILabel!
    @IBOutlet weak var lblproductname: UILabel!
    @IBOutlet weak var lblproductdetails: UILabel!
    @IBOutlet weak var lblproductprice: UILabel!
    @IBOutlet weak var lblproductqty: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblproductid.isHidden = true
        lblproductqty.isHidden = true
        lblproductdetails.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
