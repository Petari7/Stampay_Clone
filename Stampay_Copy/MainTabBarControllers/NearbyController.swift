//
//  NearbyController.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 25/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NearbyController: UIViewController {
    
let mapView: MKMapView  = {
let map = MKMapView()
return map
        
}()
    
let locationManager = CLLocationManager()
var latMeters: Double = 10000
var longMeters: Double = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        setupNav()
        setupMap()
        addMapView()
       
    
      
    }
    
@objc func zoomToUsersLocation() {
    

    guard let lat = mapView.userLocation.location?.coordinate.latitude else { return }
    guard let long = mapView.userLocation.location?.coordinate.longitude else { return }
    
let cllLocation = CLLocationCoordinate2DMake(lat, long)
zoomIn(coordinate: cllLocation)


}
    
func setupNav() {
let barButtom = UIBarButtonItem(image: #imageLiteral(resourceName: "location"), style: .done, target: self, action: #selector(zoomToUsersLocation))

barButtom.tintColor = .white
navigationItem.rightBarButtonItem = barButtom
}

    
func addMapView() {
    
view.addSubview(mapView)
    
mapView.setAutoLayout(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 0)
    
}
  
func setupLocationManager() {
    
locationManager.delegate = self
locationManager.desiredAccuracy = kCLLocationAccuracyBest
   
    
    
}
    
func showUsersLocation() {
    
if let location = locationManager.location?.coordinate {
        
let region = MKCoordinateRegion.init(center: location, latitudinalMeters: latMeters, longitudinalMeters: longMeters)
    
mapView.setRegion(region, animated: true)

}
    
}
    
    
func setupMap() {
    

    
if CLLocationManager.locationServicesEnabled() {
setupLocationManager()
checkLocationServices()

}
        
}
    
func checkLocationServices() {
    
switch CLLocationManager.authorizationStatus() {
        
case .authorizedWhenInUse:
mapView.showsUserLocation = true
showUsersLocation()

case .notDetermined:
locationManager.requestWhenInUseAuthorization()

    

        
default:
print("default")
}

    
}
    
}

extension NearbyController: CLLocationManagerDelegate {
    
    
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    guard let location = locations.last else { return }
    
    let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    
   let region =  MKCoordinateRegion.init(center: center, latitudinalMeters: latMeters, longitudinalMeters: longMeters)
    
    mapView.setRegion(region, animated: true)
    
    
    }
    
    
}

extension NearbyController {
    func zoomIn(coordinate: CLLocationCoordinate2D, withLevel level:CLLocationDistance = 10000){
        let camera =
            MKMapCamera(lookingAtCenter: coordinate, fromEyeCoordinate: coordinate, eyeAltitude: level)
    mapView.setCamera(camera, animated: true)
    }
}
