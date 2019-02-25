//
//  RequestFactory.swift
//  BeBlueChallenge
//
//  Created by Aloisio Mello on 24/02/19.
//  Copyright © 2019 Aloisio Mello. All rights reserved.
//

import Foundation
import Alamofire

struct RequestFactory {
    var url : URL
    let parameters : [String: Any]?
    let method : HTTPMethod
    var headers : HTTPHeaders?
}
