//
//  OrderlistViewController.swift
//  CategoryListApi
//
//  Created by Apple on 24/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class OrderlistViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_product_name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ordercell") as! OrderlistTableViewCell
        cell.lblProductname.text = arr_product_name[indexPath.row]
        cell.lblProductprice.text = arr_product_price[indexPath.row]
        cell.lblProductqty.text = arr_product_qty[indexPath.row]
        let url = URL(string: arr_product_image[indexPath.row])
        cell.OrderlistImageview.af.setImage(withURL: url!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            self.API_OrderRemove(user_id: arr_product_name[indexPath.row], order_id: arr_product_name[indexPath.row], cancel_reason: arr_product_name[indexPath.row])
        }
    }
    
    @IBOutlet weak var OrderListTableView: UITableView!
    var arr_product_name = [String]()
    var arr_product_price = [String]()
    var arr_product_qty = [String]()
    var arr_product_image = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API_OrderList()
        OrderListTableView.dataSource = self
        OrderListTableView.delegate = self
        
    }
    
    
    func API_OrderList(){
        let url = "https://D3.in/myapi/ecom1/api/api-order-list.php"
        let param:Parameters = ["user_id":1]
        AF.request(url, method: .post, parameters: param).responseJSON{
            (response) in
            switch response.result{
            case .success:
                let myresult = try?JSON(data: response.data!)
                print(response.result)
                
                let resultArray = myresult!["order-list"]
                
                self.arr_product_name.removeAll()
                self.arr_product_price.removeAll()
                self.arr_product_qty.removeAll()
                self.arr_product_image.removeAll()
                
                for i in resultArray.arrayValue{
                    let product_name = i["product_name"].stringValue
                    self.arr_product_name.append(product_name)
                    
                    let product_price = i["product_price"].stringValue
                    self.arr_product_price.append(product_price)
                    
                    let product_qty = i["product_qty"].stringValue
                    self.arr_product_qty.append(product_qty)
                    
                    let product_image = i["product_image"].stringValue
                    self.arr_product_image.append(product_image)
                    
                    print(product_name)
                    print(product_price)
                    print(product_qty)
                    print(product_image)
                }
                self.OrderListTableView.reloadData()
                    break
                case .failure:
                    break
                }
                
            }
        }
    func API_OrderRemove(user_id:String,order_id:String,cancel_reason:String){
        let url = "https://D3.in/myapi/ecom1/api/api-order-remove.php"
        let param:Parameters = ["user_id":user_id,
                                "order_id":order_id,
                                "cancel_reason":cancel_reason]
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

