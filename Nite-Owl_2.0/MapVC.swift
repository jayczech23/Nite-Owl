//
//  MapVC.swift
//  Nite-Owl_2.0
//
//  Created by Jordan Cech on 10/26/16.
//  Copyright © 2016 Jordan Cech. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import SwiftKeychainWrapper

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    
    
//----------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
    }
//----------------------------------------------------------------
    
    override func viewDidAppear(_ animated: Bool) {
        
        locationAuthStatus()
    
    }
//----------------------------------------------------------------
    
    func locationAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            
            locationManager.requestWhenInUseAuthorization()
        
        }
    }
//----------------------------------------------------------------
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            
            mapView.showsUserLocation = true
        
        }
    }
//----------------------------------------------------------------
    
    func centerMapOnLocation(location: CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000) // zoom level
        
        mapView.setRegion(coordinateRegion, animated: true)
    
    }
//----------------------------------------------------------------

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        if let loc = userLocation.location {
            
            if !mapHasCenteredOnce {
                
                centerMapOnLocation(location: loc)
                mapHasCenteredOnce = true
            }
        }
    }
//----------------------------------------------------------------
    
   /* // custom annotation icon for user location 'Blip'
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView: MKAnnotationView?
        
        if annotation.isKind(of: MKUserLocation.self) {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "default")
            annotationView?.image = UIImage(named: "user")
        }
        return annotationView
    }*/
//----------------------------------------------------------------
    
    @IBAction func signOutBtnTapped(_ sender: Any) {
        
        let keyChainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("JAY: REMOVED FROM KEYCHAIN? \(keyChainResult)")
        try! FIRAuth.auth()?.signOut()
        
        performSegue(withIdentifier: signOutSegue, sender: nil)
        
    }
//----------------------------------------------------------------
    
}























