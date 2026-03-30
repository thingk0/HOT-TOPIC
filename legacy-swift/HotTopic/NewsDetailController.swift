import UIKit
import WebKit

class NewsDetailController : UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    @IBAction func btnGoSite(_ sender: Any) {
        
        if let url = URL(string: detailUrl! ) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    var imageUrl : String?
    var desc : String?
    var detailUrl : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      if let img = imageUrl {
          if let data = try? Data(contentsOf: URL(string: img)!){
              DispatchQueue.main.async {
                  self.ImageMain.image = UIImage(data: data)
             }
          }
       }
    
    if let d = desc {
        self.LabelMain.text = d
    }
        
  }
}
