//
//  ViewController.swift
//  Buspper
//
//  Created by Carlos Linares on 2/7/16.
//  Copyright © 2016 Carlos Linares. All rights reserved.
//

import UIKit
import Mapbox

class HomeController: UIViewController, MGLMapViewDelegate {
    
    
    @IBOutlet var mapView: MGLMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the map
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        // Set some UI
        let logo = UIImage(named: "logo")
        let imageViewLogo = UIImageView(image: logo)
        self.navigationItem.titleView = imageViewLogo
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showUpListRoutes() {
        //        let listRoutesView = ListRoutesView.instanceFromNib()
        //        self.view.addSubview(listRoutesView)
        
    }
    
}

// MARK: MapBox
extension HomeController {
    
    // MARK: Implemented methods of MGLMapViewDelegate
    
    func mapView(mapView: MGLMapView, imageForAnnotation annotation: MGLAnnotation) -> MGLAnnotationImage? {
        var annotationImage = mapView.dequeueReusableAnnotationImageWithIdentifier("stop")
        if annotationImage == nil {
            
            let image = UIImage(named: "stop")
            annotationImage = MGLAnnotationImage(image: image!, reuseIdentifier: "stop")
            
        }
        
        return annotationImage
    }
    
    func mapView(mapView: MGLMapView, didUpdateUserLocation userLocation: MGLUserLocation?) {
        mapView.setCenterCoordinate((userLocation?.coordinate)!, zoomLevel: 15, animated: true)
    }
    
    // MARK: Additional things
    
    func addStop(coordinates: CLLocationCoordinate2D) {
        let stop = MGLPointAnnotation()
        stop.coordinate = coordinates
        mapView.addAnnotation(stop)
    }
    
    
}