//
//  Map.swift
//  graphtest
//
//  Created by Ryo  on 2023/02/9.
//

import SwiftUI
import MapKit
import CoreLocation

struct Map: View {
    var body: some View {
        
        SUMapView()
            .statusBar(hidden: true)
            .ignoresSafeArea(edges: .all)
    }
    
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}

let cntrx = 37.524153824742076
let cntry = 139.93829179493102

let cafx = 37.52406330979065
let cafy = 139.9373735417016

let labx = 37.52368387107481
let laby = 139.93915346049025

let lecx = 37.524491147530824
let lecy = 139.9381623685967

struct SUMapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    let mapViewDelegate = MapViewDelegate()
    func makeUIView(context: UIViewRepresentableContext<SUMapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<SUMapView> ) {
        
        uiView.delegate = mapViewDelegate
        
        let coordinatecntr = CLLocationCoordinate2D(latitude: cntrx, longitude: cntry)
        let coordinatecaf = CLLocationCoordinate2D(latitude: cafx, longitude: cafy)
        let coordinatelab = CLLocationCoordinate2D(latitude: labx, longitude: laby)
        let coordinatelec = CLLocationCoordinate2D(latitude: lecx, longitude: lecy)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.0016, longitudeDelta: 0.0016)
        let region = MKCoordinateRegion(center: coordinatecntr, span: span)
        uiView.setRegion(region, animated: true)
        
        let cafs = 50
        let labs = 30
        let lecs = 40
        
        let circlecaf1 = MKCircle(center: coordinatecaf, radius: CLLocationDistance((cafs*3/3)))
        let circlecaf2 = MKCircle(center: coordinatecaf, radius: CLLocationDistance((cafs*2/3)))
        let circlecaf3 = MKCircle(center: coordinatecaf, radius: CLLocationDistance((cafs*1/3)))
        
        let circlelab1 = MKCircle(center: coordinatelab, radius: CLLocationDistance((labs*3/3)))
        let circlelab2 = MKCircle(center: coordinatelab, radius: CLLocationDistance((labs*2/3)))
        let circlelab3 = MKCircle(center: coordinatelab, radius: CLLocationDistance((labs*1/3)))
        
        let circlelec1 = MKCircle(center: coordinatelec, radius: CLLocationDistance((lecs*3/3)))
        let circlelec2 = MKCircle(center: coordinatelec, radius: CLLocationDistance((lecs*2/3)))
        let circlelec3 = MKCircle(center: coordinatelec, radius: CLLocationDistance((lecs*1/3)))
        
        circlecaf1.title="caf1"
        circlecaf2.title="caf1"
        circlecaf3.title="caf1"
        
        circlelab1.title="lab1"
        circlelab2.title="lab2"
        circlelab3.title="lab3"
        
        circlelec1.title="lec1"
        circlelec2.title="lec2"
        circlelec3.title="lec3"
        
        uiView.addOverlay(circlecaf1)
        uiView.addOverlay(circlecaf2)
        uiView.addOverlay(circlecaf3)
        
        uiView.addOverlay(circlelab1)
        uiView.addOverlay(circlelab2)
        uiView.addOverlay(circlelab3)
        
        uiView.addOverlay(circlelec1)
        uiView.addOverlay(circlelec2)
        uiView.addOverlay(circlelec3)
    }
    
}

class MapViewDelegate: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circle: MKCircleRenderer = MKCircleRenderer(overlay: overlay)
        circle.strokeColor = UIColor.gray
        if overlay.title == "caf1" {
            circle.fillColor = UIColor(red: 0,green: 0,blue: 0.3,alpha: 0.3)
        }else if overlay.title == "caf2" {
            circle.fillColor = UIColor(red: 0,green: 0,blue: 0.6,alpha: 0.3)
        }else if overlay.title == "caf3" {
            circle.fillColor = UIColor(red: 0,green: 0, blue: 1.0, alpha: 0.3)
        }else if overlay.title == "lab1" {
            circle.fillColor = UIColor(red: 0, green: 0.3,blue: 0,alpha: 0.3)
        }else if overlay.title == "lab2" {
            circle.fillColor = UIColor(red: 0,  green: 0.6, blue: 0, alpha: 0.3)
        }else if overlay.title == "lab3" {
            circle.fillColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 0.3)
        } else if overlay.title == "lec1" {
            circle.fillColor = UIColor(red: 0.26, green: 0.17,  blue: 0.07, alpha: 0.3)
        }else if overlay.title == "lec2" {
            circle.fillColor = UIColor(red: 0.52, green: 0.34, blue: 0.14,  alpha: 0.3)
        }else if overlay.title == "lec3" {
            circle.fillColor = UIColor(red: 0.8, green: 0.5,  blue: 0.2,  alpha: 0.3)
        }
        circle.lineWidth = 2.0
        return circle
    }
}

/*
 func tude2place(late x : Double,long y : Double)->String{
 var place = "where?"
 if (x <= 37.52423127005097 && x >= 37.52415837938047 && y <= 139.93797798733237 && y >= 139.9371003707232){
 place = "Not in UoA"
 }
 else if (x <= 37.52423127005097 && x >= 37.52415837938047 && y <= 139.93797798733237 && y >= 139.9371003707232){
 place = "cafe"
 }else if (x <= 37.52423127005097 && x >= 37.52415837938047 && y <= 139.93797798733237 && y >= 139.9371003707232){
 place = "lec"
 }else if (x <= 37.52423127005097 && x >= 37.52415837938047 && y <= 139.93797798733237 && y >= 139.9371003707232){
 place = "lab"
 }
 return place
 }
 */
