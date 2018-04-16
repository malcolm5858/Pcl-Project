//
//  User.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/19/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import Foundation

struct User: Codable {
    var username: String
    var profilePicture: Data
    var bio: String
}
