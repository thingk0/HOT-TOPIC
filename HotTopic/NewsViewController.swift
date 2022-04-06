import UIKit

class NewsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    // 몇 개를 셀에 표시할 것이냐?
    
    var newsData : Array<Dictionary<String,Any>>?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let news = newsData {
            
            return news.count
            
        }
        
        else {
            
            return 0
        }
    }
    
           // 셀에 무엇을 표시할 것이냐?
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cell
        let idx = indexPath.row
        if let news = newsData {
            
            
            // r은 각 셀의 인스턴스 -> 배열의 형태로 캐스팅 -> 셀은 재사용된다. -> 헤드라인 표시
            
            let row = news[idx]
            if let r = row as? [String : Any] {
            
                if let title = r["title"] as? String {
                    
                    cell.labelText.text = title
                    
                }
            }
        }
        
        
        return cell
    }
    

    // 클릭시에 무엇을 할 것이냐
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "NewsDetailController") as! NewsDetailController
        
       
    }
    // 데이터 전달 (이미지 ,  헤드라인 , 세부내용 , url)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "NewsDetail" == id {
            
            if let controller = segue.destination as? NewsDetailController {
                
                if let news = newsData {
                    
                    if let indexPath = tableViewMain.indexPathForSelectedRow {
                        
                        let row = news[indexPath.row]
                        
                           if let r = row as? [String : Any] {
                            
                              if let imageUrl = r["urlToImage"] as? String {
                                  
                                   controller.imageUrl = imageUrl
                              }
                            
                                  if let desc = r["description"] as? String {
                                
                                        controller.desc = desc
                                  }
                            
                                      if let detailUrl = r["url"] as? String {
                                
                                            controller.detailUrl = detailUrl
                                  }
                        }
                    }
                }
            }
        }
    }
    
    
    @IBOutlet weak var tableViewMain: UITableView!
    
    // 1. naver api를 사용한 데이터 호출
    // 2, newsapi를 사용한 데이터 호출

    func requestAPIToNaver(){
        // let getnewsapi : String = "https://newsapi.org/v2/top-headlines?country=kr&apiKey=2aaed997cd4b4081a73c53d9f585a52f"
        // navernews api :  articles 대신 items로 변경 "https://openapi.naver.com/v1/search/news.json?query=%EC%A3%BC%EC%8B%9D&display=20&start=1&sort=date"
        let clientID : String = "hkDjjW7uqkljwkHuXPAo"
        let clientKEY : String = "BstV_WDKLC"
        
        
        let query : String = "https://newsapi.org/v2/top-headlines?country=kr&apiKey=2aaed997cd4b4081a73c53d9f585a52f"
        let encodedQuery : String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let queryURL : URL = URL(string: encodedQuery)!
        
        var requestURL = URLRequest(url: queryURL)
        requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(clientKEY, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            

            if let dataJson = data {
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary <String,Any>
                    
                    // 데이터 크롤링 naver api호출시 articles -> items로 변경 요청
                      
                    let items = json["articles"] as! Array<Dictionary<String,Any>>
                    print(items)
                    
                    self.newsData = items
                    
                    // 메인스레드 호출 리로드 데이터를 통해 화면에 동기화 작업.
                    
                    DispatchQueue.main.async {
                        self.tableViewMain.reloadData()
                    }
                    
                
                }
                
                catch{}
                
            }
            
        }
        
        task.resume()

}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
        
        // naver api 호출 코드로 변경x
        requestAPIToNaver()
       
    }
}


