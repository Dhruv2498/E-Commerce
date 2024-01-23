//
//  OrderlistTableViewCell.swift
//  CategoryListApi
//
//  Created by Apple on 12/09/23.
//

import UIKit

class OrderlistTableViewCell: UITableViewCell {

    @IBOutlet weak var lblProductname: UILabel!
    @IBOutlet weak var lblProductprice: UILabel!
    @IBOutlet weak var lblProductqty: UILabel!
    @IBOutlet weak var OrderlistImageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
