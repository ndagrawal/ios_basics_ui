//
//  ParKViewController.swift
//  Park View
//
//  Created by Nilesh on 1/15/16.
//  Copyright © 2016 Chris Wagner. All rights reserved.
//

import Foundation
import MapKit

// MARK: - Map View delegate

extension ParkMapViewController: MKMapViewDelegate {


    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer! {
        if overlay is ParkMapOverlay {
            let magicMountainImage = UIImage(named: "overlay_park")
            let overlayView = ParkMapOverlayView(overlay: overlay, overlayImage: magicMountainImage!)
            return overlayView
        }else if overlay is MKPolyline {
            let lineView = MKPolylineRenderer(overlay: overlay)
            lineView.strokeColor = UIColor.greenColor()
            return lineView
        }else if overlay is MKPolygon {
            let polygonView = MKPolygonRenderer(overlay: overlay)
            polygonView.strokeColor = UIColor.magentaColor()
            return polygonView
        }else if overlay is Character {
            let circleView = MKCircleRenderer(overlay: overlay)
            circleView.strokeColor = (overlay as! Character).color
            return circleView
        }

        return nil
    }

    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView! {
        let annotationView = AttractionAnnotationView(annotation: annotation, reuseIdentifier: "Attraction")
        annotationView.canShowCallout = true
        return annotationView
    }
}