import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_category_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! CategoryTableViewCell
        cell.lblCategoryId.text = arr_category_id[indexPath.row]
        cell.lblCategoryname.text = arr_category_name[indexPath.row]
        let url = URL(string: arr_category_image[indexPath.row])
        cell.catimageview.af.setImage(withURL: url!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let main = storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController{
         main.category_id = arr_category_id[indexPath.row]
        self.navigationController?.pushViewController(main, animated: true)
    }
    }

    @IBOutlet weak var CategoryListTableView: UITableView!
    var arr_category_id = [String]()
    var arr_category_name = [String]()
    var arr_category_image = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryListTableView.dataSource = self
        CategoryListTableView.delegate = self
        API_ListCategory()
    }
    
    func API_ListCategory(){
        let url = "https://D3.in/myapi/ecom1/api/api-view-category.php"
        AF.request(url).responseJSON{(response) in
            switch response.result{
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["category_list"])
                
                let resultArray = myresult!["category_list"]
                print(resultArray["category_list"])
                
                self.arr_category_id.removeAll()
                self.arr_category_name.removeAll()
                self.arr_category_image.removeAll()
                
                for i in resultArray.arrayValue{
                    let category_id = i["category_id"].stringValue
                    self.arr_category_id.append(category_id)
                    
                    let category_name = i["category_name"].stringValue
                    self.arr_category_name.append(category_name)
                    
                    let category_image = i["category_image"].stringValue
                    self.arr_category_image.append(category_image)
                    
                    print(category_id)
                    print(category_name)
                    print(category_image)
                }
                self.CategoryListTableView.reloadData()
                break
            case .failure:
                break
            }
        }
    }
  
}
