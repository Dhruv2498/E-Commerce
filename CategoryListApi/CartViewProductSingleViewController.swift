//
//  CartViewProductSingleViewController.swift
//  CategoryListApi
//
//  Created by Apple on 24/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class CartViewProductSingleViewController: UIViewController {

    @IBOutlet weak var Txtuserid: UITextField!
    @IBOutlet weak var TxtProductid: UITextField!
    @IBAction func BtnCartView(_ sender: Any) {
        API_ViewCart()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func API_ViewCart(){
        let url = "https://D3.in/myapi/ecom1/api/api-cart-view-product-single.php"
        let param:Parameters = ["user_id":Txtuserid.text!,
                                "product_id":TxtProductid.text!]
        AF.request(url, method: .post, parameters: param).responseJSON{
            (response) in
            switch response.result{
            case .success:
                let responseData = JSON(response.data!)
                print(responseData)
                break
            case .failure:
                break
            }
            
        }
    }

}
