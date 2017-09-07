//
//  ViewController.swift
//  MapsInSwift
//
//  Created by MANISH on 24/07/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
class ViewController: UIViewController, UISearchBarDelegate, GMSAutocompleteViewControllerDelegate {

    @IBOutlet var searchBar: UISearchBar!
    var acController:GMSAutocompleteViewController?
    var mapView: GMSMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.titleView = self.searchBar
        loadMap()
        var name:String? = nil
        initAutocompleteVC()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        present(acController!, animated: false, completion: nil)
    }
    
    func initAutocompleteVC() {
        acController = GMSAutocompleteViewController()
        acController?.delegate = self
    }
    
    //MARK: PlaceAutoCompleteDelegate
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        dismiss(animated: true, completion: {
            self.markSelectedPlace(selectedPlace: place)
        })
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: \(error)")
        dismiss(animated: true, completion: nil)
    }
    
    // User cancelled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        print("Autocomplete was cancelled.")
        dismiss(animated: true, completion: nil)
    }

    
    func markSelectedPlace(selectedPlace:GMSPlace) {
        let marker = GMSMarker.init(position: selectedPlace.coordinate)
        marker.title = selectedPlace.placeID
        let cameraPosition = GMSCameraPosition.camera(withTarget: selectedPlace.coordinate, zoom: 15.0)
        mapView?.animate(to: cameraPosition)
    }
    
    func loadMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 40.8042, longitude: -74.0120, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 40.8042, longitude: -74.0120)
        marker.title = "North Bergen"
        marker.snippet = "United States"
        marker.map = mapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//extension ViewController: GMSAutocompleteViewControllerDelegate {
//    
//    // Handle the user's selection.
//    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
//        placeSelected = place
//        dismiss(animated: true, completion: nil)
//    }
//    
//    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
//        print("Error: \(error)")
//        dismiss(animated: true, completion: nil)
//    }
//    
//    // User cancelled the operation.
//    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
//        print("Autocomplete was cancelled.")
//        dismiss(animated: true, completion: nil)
//    }
//}


