//
//  SearchTableViewCell.swift
//  CategoryListApi
//
//  Created by Apple on 22/08/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var lblprodid: UILabel!
    
    @IBOutlet weak var lblprodname: UILabel!
    @IBOutlet weak var lblproddetails: UILabel!
    @IBOutlet weak var lblprodprice: UILabel!
    @IBOutlet weak var lblprodqty: UILabel!
    @IBOutlet weak var lblprodsubcatname: UILabel!
    @IBOutlet weak var lblprodsubcatid: UILabel!
    @IBOutlet weak var lblprodincart: UILabel!
    @IBOutlet weak var searchimageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
