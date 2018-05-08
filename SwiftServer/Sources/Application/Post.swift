//
//  Post.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/19/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import Foundation

struct Post: Codable {
    var user: User
    var caption: String
    var coordinate: Coordinate
}


public struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double
}



