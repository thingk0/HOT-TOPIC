// 받은 데이터들을 매핑한다.
import Foundation

struct CityCovidOverview : Codable {
    
    let seoul : CovidOverview
    let busan : CovidOverview
    let daegu : CovidOverview
    let incheon : CovidOverview
    let gwangju : CovidOverview
    let daejeon : CovidOverview
    let jeonbuk : CovidOverview
    let jeonnam : CovidOverview
    let gyeongbuk : CovidOverview
    let gyeongnam : CovidOverview
    let jeju : CovidOverview
    let ulsan : CovidOverview
    let sejong : CovidOverview
    let gyeonggi : CovidOverview
    let gangwon : CovidOverview
    let chungbuk : CovidOverview
    let chungnam : CovidOverview
    let korea : CovidOverview
    
}



struct CovidOverview : Codable {
    
    let countryName: String
    let newCase : String
    let totalCase : String
    let recovered: String
    let death: String
    let percentage : String
    let newCcase: String
    let newFcase : String
    
}
