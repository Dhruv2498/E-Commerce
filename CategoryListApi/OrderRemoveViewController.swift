//
//  OrderRemoveViewController.swift
//  CategoryListApi
//
//  Created by Apple on 24/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class OrderRemoveViewController: UIViewController {

    @IBOutlet weak var Txtorderid: UITextField!
    @IBOutlet weak var Txtuserid: UITextField!
    @IBOutlet weak var Txtcancelreason: UITextField!
    
    @IBAction func BtnOrderRemove(_ sender: Any) {
        API_OrderRemove()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func API_OrderRemove(){
        let url = "https://D3.in/myapi/ecom1/api/api-order-remove.php"
        let param:Parameters = ["user_id":Txtuserid.text!,
                                "order_id":Txtorderid.text!,
                                "cancel_reason":Txtcancelreason.text!]
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

