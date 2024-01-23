import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_sub_category_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subcell") as! MYSubCategoryTableViewCell
        cell.lblsubcategoryid.text = arr_sub_category_id[indexPath.row]
        cell.lblsubcategoryname.text = arr_sub_category_name[indexPath.row]
        cell.lblcatid.text = arr_category_id[indexPath.row]
        cell.lblcatname.text = arr_category_name[indexPath.row]
        
        let url = URL(string: arr_sub_category_image[indexPath.row])
        cell.subcatimageview.af.setImage(withURL: url!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let main = storyboard?.instantiateViewController(identifier: "FourthViewController") as? FourthViewController{
        main.sub_category_id = arr_sub_category_id[indexPath.row]
        self.navigationController?.pushViewController(main, animated: true)
    }
    }
    @IBOutlet weak var lblcatid: UILabel!
     var category_id = ""
    @IBOutlet weak var SubCategoryTableView: UITableView!
    var arr_sub_category_id = [String]()
    var arr_sub_category_name = [String]()
    var arr_category_id = [String]()
    var arr_category_name = [String]()
    var arr_sub_category_image = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SubCategoryTableView.delegate = self
        SubCategoryTableView.dataSource = self
        API_ListSubCategory()
        lblcatid.text = category_id
        lblcatid.isHidden = true
    }
    
    func API_ListSubCategory(){
        let url = "https://D3.in/myapi/ecom1/api/api-subcategory-list.php?category_id=\(category_id)"
        AF.request(url).responseJSON{(response) in
            switch response.result{
            case .success:
              //  print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["sub_category_list"])
                
                let resultArray = myresult!["sub_category_list"]
                print(resultArray["sub_category_list"])
                
                self.arr_sub_category_id.removeAll()
                self.arr_sub_category_name.removeAll()
                self.arr_category_id.removeAll()
                self.arr_category_name.removeAll()
                self.arr_sub_category_image.removeAll()
                
                for i in resultArray.arrayValue{
                    let sub_category_id = i["sub_category_id"].stringValue
                    self.arr_sub_category_id.append(sub_category_id)
                    
                    let sub_category_name = i["sub_category_name"].stringValue
                    self.arr_sub_category_name.append(sub_category_name)
                    
                    let category_id = i["category_id"].stringValue
                    self.arr_category_id.append(category_id)
                    
                    let category_name = i["category_name"].stringValue
                    self.arr_category_name.append(category_name)
                    
                    let sub_category_image = i["sub_category_image"].stringValue
                    self.arr_sub_category_image.append(sub_category_image)
                    
                    print(sub_category_id)
                    print(sub_category_name)
                    print(category_id)
                    print(category_name)
                    print(sub_category_image)
                }
                self.SubCategoryTableView.reloadData()
                break
            case .failure:
                break
            }
        }
    }
  
}


