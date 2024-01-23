import Alamofire
import AlamofireImage
import UIKit
import SwiftyJSON
class CartListTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_product_name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartlistcell") as! cartListTableViewCell
        cell.lblcartid.text = arr_cart_id[indexPath.row]
        cell.lblpid.text = arr_product_id[indexPath.row]
        cell.lblpname.text = arr_product_name[indexPath.row]
        cell.lblpdetails.text = arr_product_details[indexPath.row]
        cell.lblpprice.text = arr_product_price[indexPath.row]
        cell.lblpqty.text = arr_product_qty[indexPath.row]
        let url = URL(string: arr_product_image[indexPath.row])
        cell.pimageview.af.setImage(withURL: url!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
        
    }
 //   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 //       <#code#>
 //   }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            self.API_CartRemove(cart_id: arr_product_name[indexPath.row])
        }
    }

    @IBAction func CartUpdateBtn(_ sender: Any) {
        let home = storyboard?.instantiateViewController(identifier: "CartUpdateViewController") as! CartUpdateViewController
      //  home.Cart_id = arr_product_name[0]
        self.navigationController?.pushViewController(home, animated: true)
    }
    @IBOutlet weak var CartListTableView: UITableView!
    var arr_cart_id = [String]()
    var arr_product_id = [String]()
    var arr_product_name = [String]()
    var arr_product_details = [String]()
    var arr_product_price = [String]()
    var arr_product_qty = [String]()
    var arr_product_image = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CartListTableView.dataSource = self
        CartListTableView.delegate = self
        API_CartList()
    }
    func API_CartList(){
        let url = "https://D3.in/myapi/ecom1/api/api-cart-list.php"
        let param:Parameters = ["user_id":1]
        AF.request(url, method: .post ,parameters: param).responseJSON{(response) in
            switch response.result{
            case .success:
                let myresult = try?JSON(data: response.data!)
                print(response.result)
                
                let resultArray = myresult!["cart_list"]
                self.arr_cart_id.removeAll()
                self.arr_product_id.removeAll()
                self.arr_product_name.removeAll()
                self.arr_product_details.removeAll()
                self.arr_product_price.removeAll()
                self.arr_product_qty.removeAll()
                self.arr_product_image.removeAll()
                
                for i in resultArray.arrayValue{
                    let cart_id = i["cart_id"].stringValue
                    self.arr_cart_id.append(cart_id)
                    
                    let product_id = i["product_id"].stringValue
                    self.arr_product_id.append(product_id)
                    
                    let product_name = i["product_name"].stringValue
                    self.arr_product_name.append(product_name)
                    
                    let product_details = i["product_details"].stringValue
                    self.arr_product_details.append(product_details)
                    
                    let product_price = i["product_price"].stringValue
                    self.arr_product_price.append(product_price)
                    
                    let product_qty = i["product_qty"].stringValue
                    self.arr_product_qty.append(product_qty)
                    
                    let product_image = i["product_image"].stringValue
                    self.arr_product_image.append(product_image)
                    
                    print(cart_id)
                    print(product_id)
                    print(product_name)
                    print(product_details)
                    print(product_price)
                    print(product_qty)
                    print(product_image)
                }
                self.CartListTableView.reloadData()
                break
            case .failure:
                break
            }
        }
    }
    func API_CartRemove(cart_id:String){
        let url = "https://D3.in/myapi/ecom1/api/api-cart-remove-product.php"
        let param:Parameters = ["cart_id":cart_id]
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
