//
//  HomeDatasourceController.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/13/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents
import CoreLocation


class HomeDatasourceController: DatasourceController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        SaveAndLoadData.sharedInstance.savePost(post: Post(user: User(username: "Malcolm", profilePicture: UIImagePNGRepresentation(#imageLiteral(resourceName: "MalcolmProfile"))!, bio: ""), caption: "Caption", postImage: UIImagePNGRepresentation(#imageLiteral(resourceName: "Nature1"))!, coordinate: Coordinate(latitude: 42.538713699999995, longitude: -83.2443334)))
        super.viewDidLoad()
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
        
        self.collectionView?.bounces = true
        self.collectionView?.alwaysBounceVertical = true
        
        
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        setupData()
        update()
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 550)
    }
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
 */
    func pushUserVC(postAtIndex: Post?){
        let UserVC = UserDatasourceController()
        guard let datasource: UserDatasource = UserVC.datasource as? UserDatasource else {
            print("Error at pushUserVC")
            return
        }
        setupNavagationBar()
        datasource.postAtIndex = postAtIndex
        self.navigationController?.pushViewController(UserVC, animated: true)
    }
    
    func setupNavagationBar() {
        let customBackButton = UIBarButtonItem()
        self.navigationController?.view.tintColor = UIColor.black
        self.navigationItem.backBarButtonItem = customBackButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        else if CLLocationManager.authorizationStatus() == .denied {
            showAlert("Location services were previously denied. Please enable location services for this app in Settings.")
        }
        else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
        update()
        
        
    }
    
    //MARK: temp for beacons of pics
    func setupData(){
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            
            let title = "Seaholm High School"
            let coordinate = CLLocationCoordinate2DMake(42.538713699999995, -83.2443334)
            let radius = 300.0
            
            let region = CLCircularRegion(center: coordinate, radius: radius, identifier: title)
            
            locationManager.startMonitoring(for: region)
            
            
        }
        else {
            print("System cant track region's")
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        showAlert("Entered " + region.identifier)
    }
    
    func showAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    public func update() {
        let coordinate = CLLocationCoordinate2DMake(42.538713999999999, -83.2443334)
        print(coordinate.latitude)
        if locationManager.location?.coordinate.latitude == 42.538713999999999 {
            SaveAndLoadData.sharedInstance.posts = [Post(user: User(username: "Malcolm", profilePicture: UIImagePNGRepresentation(#imageLiteral(resourceName: "MalcolmProfile"))!, bio: ""), caption: "Caption", postImage: UIImagePNGRepresentation(#imageLiteral(resourceName: "Nature1"))!, coordinate: Coordinate(latitude: 42.538713699999995, longitude: -83.2443334))]
            let homeDatasource = HomeDatasource()
            self.datasource = homeDatasource
        }else {
            SaveAndLoadData.sharedInstance.posts = [Post(user: User(username: "Alex", profilePicture: UIImagePNGRepresentation(#imageLiteral(resourceName: "AlexProfile"))!, bio: ""), caption: "Caption", postImage: UIImagePNGRepresentation(#imageLiteral(resourceName: "Alex1"))!, coordinate: Coordinate(latitude: 42.538713699999995, longitude: -83.2443334))]
        }
    }
}
