//
//  FilterproductViewController.swift
//  Pods
//
//  Created by Apple on 21/08/23.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class FilterproductViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_product_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filcell") as! SearchproductTableViewCell
        cell.lblproid.text = arr_product_id[indexPath.row]
        cell.lblproname.text = arr_product_name[indexPath.row]
        cell.lblprodetails.text = arr_product_details[indexPath.row]
        cell.lblproprice.text = arr_product_price[indexPath.row]
        cell.lblproqty.text = arr_product_quantity[indexPath.row]
        let url = URL(string: arr_product_image[indexPath.row])
        cell.proimageview.af.setImage(withURL: url!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
 //   @IBOutlet weak var lblsubcatid: UILabel!
 //   var sub_category_id = ""
   // @IBOutlet weak var lblcatid: UILabel!
  //  var category_id = ""
    @IBOutlet weak var lblproid: UILabel!
    var product_id = ""
    @IBOutlet weak var lblprod_name: UILabel!
    var product_name = ""
    
    @IBOutlet weak var FilterproductTableView: UITableView!
    var arr_product_id = [String]()
    var arr_product_name = [String]()
    var arr_product_details = [String]()
    var arr_product_price = [String]()
    var arr_product_quantity = [String]()
    var arr_product_image = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
     //   API_ListProductFilter()
        FilterproductTableView.dataSource = self
        FilterproductTableView.delegate = self
        
       // lblproid.isHidden = true
       // lblcatid.isHidden = true
        //lblsubcatid.isHidden = true
       // lblprod_name.isHidden = true
        
        lblproid.text = product_id
      //  lblcatid.text = category_id
       // lblsubcatid.text = sub_category_id
        lblprod_name.text = product_name
    }
    
  /*  func API_ListProductFilter(){
       // let url = "https://D3.in/myapi/ecom1/api/api-view-product.php?sub_category_id=\(sub_category_id)"
       // AF.request(url).responseJSON{(response) in
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
                    
                    print(product_id)
                    print(product_name)
                    print(product_details)
                    print(product_price)
                    print(product_quantity)
                    print(product_image)
                }
                self.FilterproductTableView.reloadData()
                break
            case .failure:
                break
            }
        }
    }*/
  
}

