//
//  CartRemoveViewController.swift
//  Pods
//
//  Created by Apple on 23/08/23.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class CartRemoveViewController: UIViewController {

    @IBOutlet weak var Txtcartid: UITextField!
    @IBAction func BtnCartRemove(_ sender: Any) {
        API_CartRemove()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func API_CartRemove(){
        let url = "https://D3.in/myapi/ecom1/api/api-cart-remove-product.php"
        let param:Parameters = ["cart_id":Txtcartid.text!]
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
