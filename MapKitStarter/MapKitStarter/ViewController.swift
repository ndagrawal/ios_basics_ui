//
//  ViewController.swift
//  MapKitStarter
//
//  Created by Nilesh on 1/15/16.
//  Copyright © 2016 CA. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController{

    //MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!

    
    //MARK: Initialization
    //Center point of the starting location.
    let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.82944)
    //The distance mentioned is in meters.
    let regionRadius:CLLocationDistance = 1000
    var artWorks = [ArtWork]()

    //MARK: View Controller Method
    override func viewDidLoad() {
        super.viewDidLoad()
        centerMapOnLocation(initialLocation)
        loadInitialData()
        mapView.delegate = self
        mapView.addAnnotations(artWorks)
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }

    //MARK: Map Setup Methods.
    func centerMapOnLocation(location:CLLocation){
        let coordinateRegion:MKCoordinateRegion! = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    //MARK: Load Data 
    func loadInitialData() {
        // 1
        let fileName = NSBundle.mainBundle().pathForResource("PublicArt", ofType: "json");
     //   var readError : NSError?
        var data :NSData!

        do{
         data = try NSData(contentsOfFile: fileName!, options: NSDataReadingOptions(rawValue: 0))
        }catch{
            print(error)
        }

        // 2
      //  var error: NSError?
        var jsonObject:AnyObject! = nil;
        do{
            jsonObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
        }catch{
            print(error)
        }

        // 3
        if let jsonObject = jsonObject as? [String: AnyObject] ,
            // 4
            let jsonData = JSONValue.fromObject(jsonObject)?["data"]?.array {
                for artworkJSON in jsonData {
                    if let artworkJSON = artworkJSON.array,
                        // 5
                        artwork = ArtWork.fromJSON(artworkJSON) {
                            artWorks.append(artwork)
                    }
                }
        }
    }




    //MARK: - location manager to authorize user location for Maps app
    var locationManager = CLLocationManager()

    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }



}

