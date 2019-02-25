//
//  PhotoList.swift
//  BeBlueChallenge
//
//  Created by Aloisio Mello on 24/02/19.
//  Copyright © 2019 Aloisio Mello. All rights reserved.
//

import Foundation

struct PhotoList : Codable{
    let photos : [Photo]
}

struct Photo : Codable{
    let img_src : String
    let camera : Camera
}

struct Camera : Codable{
    let name : String
    let full_name : String
}
