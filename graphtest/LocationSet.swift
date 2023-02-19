
import SwiftUI
import CoreLocation //CoreLocationを利用


// アプリの起動時に、位置情報を利用できるように設定してしまう
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate{
    var locationManager : CLLocationManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager!.requestAlwaysAuthorization()


        if CLLocationManager.locationServicesEnabled(){
            locationManager!.desiredAccuracy = kCLLocationAccuracyThreeKilometers //精度３km（かなり低め に設定している）
            locationManager!.distanceFilter = 10
            locationManager!.allowsBackgroundLocationUpdates = true //バックグラウンド処理を可能にする
            locationManager!.pausesLocationUpdatesAutomatically = false //ポーズしても位置取得を続ける
            locationManager!.startUpdatingLocation()
        }

        return true
    }

    //位置情報に変化があった場合の処理（今回は単純に緯度と軽度を出力する）
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        //同じかどうか判断してる？
        guard let newLocation = locations.last else {
            return
        }

        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude)
        print("緯度: ", location.latitude, "経度: ", location.longitude)
    }
}
