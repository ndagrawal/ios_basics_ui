//
//  VCMapView.swift
//  MapKitStarter
//
//  Created by Nilesh on 1/15/16.
//  Copyright © 2016 CA. All rights reserved.
//

import Foundation
import MapKit

extension ViewController: MKMapViewDelegate {

    //To get the annotation
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?{
        if let annotation:ArtWork! = annotation as! ArtWork{
            let identifier = "pin"
            var view:MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView{
                dequeuedView.annotation = annotation
                view = dequeuedView
                view.pinColor = annotation.pinColor()
                return view;
            }else{
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                //view.calloutOffset = CGPoint(x:-5,y:5)
                view.pinColor  = annotation.pinColor()
                view.rightCalloutAccessoryView = UIButton.init(type: UIButtonType.DetailDisclosure)
                return view;
            }
        }
        return nil;
    }

    //To tell what to do when the VCMapView was tapped.
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl) {
            let location = view.annotation as! ArtWork
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            location.mapItem().openInMapsWithLaunchOptions(launchOptions)
    }


    


}