import SwiftUI
import Charts


struct MapChartCard: View {

    var width: CGFloat
    var height: CGFloat
    @ObservedObject var manager = LocationManager()
     
    var body: some View {
        
        let latetude = $manager.location.wrappedValue.coordinate.latitude
        let longtitude = $manager.location.wrappedValue.coordinate.longitude
        
        let now = Date()
        let calendar = Calendar(identifier: .gregorian)
        let hour = calendar.component(.hour, from: now)
        let minute = calendar.component(.minute, from: now)
        let second = calendar.component(.second, from: now)
        
        NavigationView {
            HStack(spacing: 0){
                
                NavigationLink(destination: Map().navigationTitle("Map")) {
                    ZStack{
                        
                        SUMapView()
                            .statusBar(hidden: true)
                            .frame(height: 100)
                            .frame(width: 190)
                            .ignoresSafeArea(edges: .all)
                            .onAppear{
                                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                                    CheckTime(hour: hour, minute: minute, late: latetude, long: longtitude)
                                }
                            }
                        
                        Text("late:\(latetude)\nlong:\(longtitude)\ntime:\(hour):\(minute)")
                            .font(.caption2)
                            .italic()
                            .offset(x:57,y: -37)
                            .foregroundColor(Color.white)
                    }
                    .navigationTitle("")
                }
                
                NavigationLink(destination: Charts().navigationTitle("Charts")) {
                    Chart(sampleData) { data in
                        LineMark(
                            //AreaMark(
                            x: .value("Time", data.time),
                            y: .value("Amount", data.amount)
                        )
                        .foregroundStyle(by: .value("Form", data.from))
                        .lineStyle(StrokeStyle(lineWidth: 3))
                        .interpolationMethod(.catmullRom)
                    }
                    .frame(height: height)
                    .frame(width: width)
                    .chartLegend(.hidden)
                    .chartYAxis(.hidden)
                }
            }
            .clipped()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(
                        LinearGradient(gradient:
                                        Gradient(colors: [
                                            .clear,
                                            Color(red: 0, green: 0, blue: 0, opacity: 0.25)
                                        ]), startPoint: .init(x: 0.5, y: 0.75), endPoint: .init(x: 0.5, y: 1)))
                    .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.3),radius: 10, y: 5)
                    .background(Color.black)
            )
            .scaleEffect(1.0)
            .cornerRadius(32)
        }
    }
}

struct ChartsSampleView_Previews: PreviewProvider {
    static var previews: some View {
        MapChartCard(width: 200, height: 200)
    }
}

func CheckTime(hour h : Int,minute m : Int,late lat:Double,long log:Double)->Void{
    let time = h*60+m
   // if (time != 0){
    if (time == 480||time == 540||time == 600){
        getAPI()
        postAPI(late: lat, long: log)
    }
}


func postAPI(late lat:Double,long lng:Double)->Void{
    
    guard let url = URL(string:
                            "http://localhost:5001/splannt-dev/us-central1/review") else {
        return
    }
    print("hello")
    
    var request = URLRequest(url: url)

    request.httpMethod = "POST"
    
    request.addValue("application/json", forHTTPHeaderField: "content-type")
    
    let params: [String: Any] = ["latlng":["lat":lat,"lng":lng]]
    
    do{
        request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
    }catch{
        print("エラー1")
        print(error.localizedDescription)
    }
    /// URLにアクセス
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        do {
            if let items = data {
                
                print(items)
            } else {
                print("No data", data as Any)
            }
        } catch {
            print("エラー２")
            print("Error", error)
        }
        
    }.resume()      // タスク開始処理（必須）
    
    
}
func getAPI()->Void{
    
    guard let url = URL(string:
                            "http://localhost:5001/splannt-dev/us-central1/review/hHBiDePYkUsJrpdql7Vp") else {
        return
    }
    print("bye")
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "content-type")
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        do {
            if let items = data {
                
                
            } else {
                print("No data", data as Any)
            }
        } catch {
            print("エラー２")
            print("Error", error)
        }
    }.resume()      // タスク開始処理（必須）
    
}



