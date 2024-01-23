//
//  ProsearchViewController.swift
//  CategoryListApi
//
//  Created by Apple on 22/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class ProsearchViewController: UIViewController {
    @IBOutlet weak var txtproname: UITextField!
    
    @IBAction func BtnSearchPro(_ sender: Any) {
        API_SearchProduct()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func API_SearchProduct(){
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

}
