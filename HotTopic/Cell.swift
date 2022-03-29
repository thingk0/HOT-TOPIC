import UIKit
import Alamofire

class cell : UITableViewCell,UIWebViewDelegate {
    
    @IBOutlet weak var labelText: UILabel!
   
    @IBOutlet weak var headLineImage: UIImageView!
    
    var mainImageUrl : String?
    

    func getImage (_ str: String?) {
        
        guard str != nil, let url = URL(string: str!) else {
                                            
            return
            
        }
        
        
        if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {
            
            DispatchQueue.main.async {
                self.headLineImage.image = img
                
                
                
                
            }
        }
    }
}
    

    




    
    

