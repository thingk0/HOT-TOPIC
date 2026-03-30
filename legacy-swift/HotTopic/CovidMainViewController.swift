import UIKit
import Charts

class CovidMainViewController: UIViewController {

    
    
    @IBOutlet var totalCaseLabel: UILabel!
    @IBOutlet var newCaseLabel: UILabel!
    @IBOutlet var pieChartView: PieChartView!
    @IBOutlet var dateLabel: UILabel!
    
    
    
    func getCurrentDate() {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyy년 MM월 dd일 기준"
        
        let str = formatter.string(from: Date())
        dateLabel.text = "\(str)"
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getCurrentDate()
        

    }
    
}
