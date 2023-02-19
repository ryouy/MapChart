import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject,

CLLocationManagerDelegate {

    let manager = CLLocationManager()
    @Published var location = CLLocation()

    override init() {
        super.init()
        if CLLocationManager().authorizationStatus == .authorizedAlways {
           
            self.manager.allowsBackgroundLocationUpdates = true
        } else {
       
            self.manager.allowsBackgroundLocationUpdates = false
        }

        self.manager.delegate = self
      //  self.manager.allowsBackgroundLocationUpdates = true;
        self.manager.requestWhenInUseAuthorization()
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.distanceFilter = 1
        self.manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager,
                           didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last!
    }

}

