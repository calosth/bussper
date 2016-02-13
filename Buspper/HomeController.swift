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
        
        mapView.delegate = self
        
        let logo = UIImage(named: "logo")
        let imageViewLogo = UIImageView(image: logo)
        self.navigationItem.titleView = imageViewLogo

        mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 9,
            longitude: -79.25),
            zoomLevel: 8, animated: false)
        
        addStop(CLLocationCoordinate2D(latitude: 9, longitude: -79.25))
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

    func mapView(mapView: MGLMapView, imageForAnnotation annotation: MGLAnnotation) -> MGLAnnotationImage? {
        var annotationImage = mapView.dequeueReusableAnnotationImageWithIdentifier("stop")
        if annotationImage == nil {
            
            let image = UIImage(named: "stop")
            annotationImage = MGLAnnotationImage(image: image!, reuseIdentifier: "stop")
            
        }
        
        return annotationImage
    }
    
    func addStop(coordinates: CLLocationCoordinate2D) {
        let stop = MGLPointAnnotation()
        stop.coordinate = coordinates
        mapView.addAnnotation(stop)
    }
    
}