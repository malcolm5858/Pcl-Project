//
//  LocationPics.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 1/30/18.
//  Copyright © 2018 Malcolm Machesky. All rights reserved.
//

import UIKit

class LocationPics {
    
    private static var mInstance: LocationPics!;
    
    
    public static func getInstance() -> LocationPics {
        if mInstance == nil {
            mInstance = LocationPics()
        }
        return mInstance
    }
    
    
    private init() {
        
    }
    
    
    
    
    
    public static func getPics() -> [UIImage] {
        let pics = [#imageLiteral(resourceName: "Alex1"), #imageLiteral(resourceName: "MalcolmProfile")]
        return pics
    }
    public static func getIdentifiers() -> [String] {
        let identifiiers = ["Alex1", "MalcolmProfile"]
        return identifiiers
    }
    
}
