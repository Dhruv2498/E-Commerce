//
//  CartUpdateViewController.swift
//  Pods
//
//  Created by Apple on 23/08/23.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class CartUpdateViewController: UIViewController {

    @IBOutlet weak var TxtcartId: UITextField!
    @IBOutlet weak var TxtProductqty: UITextField!
   //var Cart_id = ""
    @IBAction func BtnCartUpdate(_ sender: Any) {
        API_CartUpdate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       // TxtcartId.text = Cart_id
    }
    
    func API_CartUpdate(){
        let url = "https://D3.in/myapi/ecom1/api/api-cart-update.php"
        let param:Parameters = ["cart_id":TxtcartId.text!,
                                "product_qty":TxtProductqty.text!]
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
