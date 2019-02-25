//
//  PhotoListFactory.swift
//  BeBlueChallenge
//
//  Created by Aloisio Mello on 24/02/19.
//  Copyright © 2019 Aloisio Mello. All rights reserved.
//

import Foundation

enum Rover {
    case Curiosity
    case Opportunity
    case Spirit
}

struct PhotoListRequestHelper{
    let endpoint = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
    let apiKey = "e9LNOolHLdQ9e3CyfCBU6YBF6UzmxECqhx3kROIy"
    let requestFactory : RequestFactory
    
    init(rover : Rover, date : String) {
        switch rover {
        case .Curiosity:
            let url = (URL(string: "\(endpoint)/curiosity/photos?earth_date=\(date)&api_key=\(apiKey)"))!
            self.requestFactory = RequestFactory.init(url: url, parameters: nil, method: .get, headers: nil)
        case .Opportunity:
            let url = (URL(string: "\(endpoint)/opportunity/photos?earth_date=\(date)&api_key=\(apiKey)"))!
            self.requestFactory = RequestFactory.init(url: url, parameters: nil, method: .get, headers: nil)
        case .Spirit:
            let url = (URL(string: "\(endpoint)/spirit/photos?earth_date=\(date)&api_key=\(apiKey)"))!
            self.requestFactory = RequestFactory.init(url: url, parameters: nil, method: .get, headers: nil)
        }
    }
}
