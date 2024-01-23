//
//  SearchProDisplayViewController.swift
//  CategoryListApi
//
//  Created by Apple on 22/08/23.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class SearchProDisplayViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arr_product_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchcell") as! SearchTableViewCell
        cell.lblprodid.text = arr_product_id[indexPath.row]
        cell.lblprodname.text = arr_product_name[indexPath.row]
        cell.lblproddetails.text = arr_product_details[indexPath.row]
        cell.lblprodprice.text = arr_product_price[indexPath.row]
        cell.lblprodqty.text = arr_product_quantity[indexPath.row]
        cell.lblprodsubcatid.text = arr_sub_category_id[indexPath.row]
        cell.lblprodsubcatname.text = arr_sub_category_name[indexPath.row]
        cell.lblprodincart.text = arr_is_product_in_cart[indexPath.row]
        
        let url = URL(string: arr_product_image[indexPath.row])
        cell.searchimageview.af.setImage(withURL: url!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    var arr_product_id = [String]()
    var arr_product_name = [String]()
    var arr_product_details = [String]()
    var arr_product_price = [String]()
    var arr_product_quantity = [String]()
    var arr_product_image = [String]()
    var arr_sub_category_name = [String]()
    var arr_sub_category_id = [String]()
    var arr_is_product_in_cart = [String]()
    
    @IBOutlet weak var SearchProdDisplaytableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        API_SearchProduct()
        SearchProdDisplaytableView.dataSource = self
        SearchProdDisplaytableView.delegate = self
       
    }
    func API_SearchProduct(){
        let url = "https://akashsir.in/myapi/ecom1/api/api-search-product.php?product_name=samsung"
        AF.request(url).responseJSON{(response) in
            switch response.result{
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["product_list"])
                
                let resultArray = myresult!["product_list"]
                print(resultArray["product_list"])
                
                self.arr_product_id.removeAll()
                self.arr_product_name.removeAll()
                self.arr_product_details.removeAll()
                self.arr_product_price.removeAll()
                self.arr_product_quantity.removeAll()
                self.arr_product_image.removeAll()
                self.arr_sub_category_id.removeAll()
                self.arr_sub_category_name.removeAll()
                self.arr_is_product_in_cart.removeAll()
                

                for i in resultArray.arrayValue{
                    let product_id = i["product_id"].stringValue
                    self.arr_product_id.append(product_id)
                    
                    let product_name = i["product_name"].stringValue
                    self.arr_product_name.append(product_name)
                    
                    let product_details = i["product_details"].stringValue
                    self.arr_product_details.append(product_details)
                    
                    let product_price = i["product_price"].stringValue
                    self.arr_product_price.append(product_price)
                    
                    let product_quantity = i["product_quantity"].stringValue
                    self.arr_product_quantity.append(product_quantity)
                    
                    let product_image = i["product_image"].stringValue
                    self.arr_product_image.append(product_image)
                    
                    let sub_category_name = i["sub_category_name"].stringValue
                    self.arr_sub_category_name.append(sub_category_name)
                    
                    let sub_category_id = i["sub_category_id"].stringValue
                    self.arr_sub_category_id.append(sub_category_id)
                    
                    let is_product_in_cart = i["is_product_in_cart"].stringValue
                    self.arr_is_product_in_cart.append(is_product_in_cart)
                    
                    print(product_id)
                    print(product_name)
                    print(product_details)
                    print(product_price)
                    print(product_quantity)
                    print(product_image)
                    print(sub_category_name)
                    print(sub_category_id)
                    print(is_product_in_cart)
                }
                self.SearchProdDisplaytableView.reloadData()
                break
            case .failure:
                break
            }
        }
    }
  
}





