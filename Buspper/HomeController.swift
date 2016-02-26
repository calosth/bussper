//
//  ViewController.swift
//  Buspper
//
//  Created by Carlos Linares on 2/7/16.
//  Copyright © 2016 Carlos Linares. All rights reserved.
//

import UIKit
import Mapbox

class HomeController: UIViewController, MGLMapViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet var searchButtonItem: UIBarButtonItem!
    @IBOutlet var mapView: MGLMapView!
    @IBOutlet var listRoutesView: ListRoutesView!
    @IBOutlet var resultSearchView: UIView!
    
    // Set  some UI
    var imageLogoView = UIImageView(image: UIImage(named: "logo"))
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 100, 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the map
        mapView.delegate = self
        mapView.showsUserLocation = true
        searchBar.delegate = self
        
        // Set some UI
        self.navigationItem.titleView = imageLogoView
        self.view.sendSubviewToBack(mapView)
        
        searchBar.placeholder = "Search "
        searchBar.showsCancelButton = true
        resultSearchView.frame.origin.y -= view.frame.height

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
       // listRoutesView.show()
        
    }
    
    // MARK: Additional things
    
    func addStop(coordinates: CLLocationCoordinate2D) {
        let stop = MGLPointAnnotation()
        stop.coordinate = coordinates
        mapView.addAnnotation(stop)
    }
    
    
}

// MARK: UISearchView 
extension HomeController {
    
    @IBAction func searchTaped(sender: AnyObject) {
        searchBar.alpha = 0
        searchBar.center.x = 0
        navigationItem.titleView = searchBar
        navigationItem.setRightBarButtonItem(nil, animated: true)
//        self.searchBar.becomeFirstResponder()

        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.searchBar.alpha = 1
            self.searchBar.center.x = self.view.frame.width
            }, completion: { finished in
        })
        
        listRoutesView.show()
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        navigationItem.setRightBarButtonItem(searchButtonItem, animated: true)
        imageLogoView.alpha = 0
        self.searchBar.center.x = self.view.frame.width
        self.searchBar.text = ""
        UIView.animateWithDuration(0.5, animations: {
            self.navigationItem.titleView = self.imageLogoView
            self.imageLogoView.alpha = 1
            self.searchBar.center.x = 0
            }, completion: { finished in
                
        })
        listRoutesView.hide()
        
    }
}