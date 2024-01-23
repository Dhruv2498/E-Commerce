//
//  CartlistViewController.swift
//  Pods
//
//  Created by Apple on 23/08/23.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class CartlistViewController: UIViewController {
    
    @IBOutlet weak var TxtUseridcartlist: UITextField!
    
    @IBAction func BtnCartList(_ sender: Any) {
        API_CartList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    func API_CartList(){
        let url = "https://D3.in/myapi/ecom1/api/api-cart-list.php"
        let param:Parameters = ["user_id":TxtUseridcartlist.text!]
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
