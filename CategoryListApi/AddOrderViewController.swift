//
//  AddOrderViewController.swift
//  Pods
//
//  Created by Apple on 23/08/23.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class AddOrderViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return payment.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return payment[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Txtpaymentmethod.text = payment[row]
        Txtpaymentmethod.resignFirstResponder()
    }
    

    @IBOutlet weak var Txtuserid: UITextField!
    @IBOutlet weak var Txtshippingname: UITextField!
    @IBOutlet weak var Txtshippingmobile: UITextField!
    @IBOutlet weak var Txtshippingaddress: UITextField!
    @IBOutlet weak var Txtpaymentmethod: UITextField!
    
    var payment = ["UPI","NetBanking","Cash","Credit Card"]
    let PickerView = UIPickerView()
    @IBAction func BtnAddOrder(_ sender: Any) {
        API_AddOrder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        PickerView.delegate = self
        PickerView.dataSource = self
        Txtpaymentmethod.inputView = PickerView
        
    }
    
    func API_AddOrder(){
        let url = "https://D3.in/myapi/ecom1/api/api-add-order.php"
        let param:Parameters = ["user_id":Txtuserid.text!,
                                "shipping_name":Txtshippingname.text!,
                                "shipping_mobile":Txtshippingmobile.text!,
                                "shipping_address":Txtshippingaddress.text!,
                                "payment_method":Txtpaymentmethod.text!]
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
