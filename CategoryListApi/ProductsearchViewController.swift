//
//  ProductsearchViewController.swift
//  Pods
//
//  Created by Apple on 21/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class ProductsearchViewController: UIViewController {


   @IBOutlet weak var txtproname: UITextField!
 
    @IBAction func btnaddproduct(_ sender: Any) {
        let url = "https://akashsir.in/myapi/ecom1/api/api-search-product.php"
         let param:Parameters = ["product_name":txtproname.text!]
                                 
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
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

  
}
