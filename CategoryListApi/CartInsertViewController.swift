//
//  CartInsertViewController.swift
//  Pods
//
//  Created by Apple on 23/08/23.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class CartInsertViewController: UIViewController {

    @IBOutlet weak var TxtUserid: UITextField!
    @IBOutlet weak var TxtProduct_id: UITextField!
    @IBOutlet weak var TxtProduct_Qty: UITextField!
    @IBOutlet weak var TxtProduct_name: UITextField!
    @IBOutlet weak var TxtProduct_price: UITextField!
    @IBOutlet weak var Txtproduct_details: UITextField!
    @IBOutlet weak var Cartimageview: UIImageView!
    @IBAction func BtnCartInsert(_ sender: Any) {
        API_CartInsert()
    }
    var product_id = ""
    var product_name = ""
    var product_price = ""
    var product_details = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        TxtProduct_id.text = product_id
        TxtProduct_name.text = product_name
        TxtProduct_price.text = product_price
        Txtproduct_details.text = product_details
        TxtUserid.text = "1"
        TxtProduct_id.isHidden = true
        TxtUserid.isHidden = true
    }
    

    func API_CartInsert(){
        let url = "https://D3.in/myapi/ecom1/api/api-cart-insert.php"
        let param:Parameters = ["user_id":TxtUserid.text!,
                                "product_id":TxtProduct_id.text!,
                                "product_qty":TxtProduct_Qty.text!]
        AF.request(url, method: .post, parameters: param).responseJSON{
            (response) in
            switch response.result{
            case .success:
                let responseData = JSON(response.data)
               print(responseData)
                break
            case .failure:
                break
            }
        }
        
    }

}
