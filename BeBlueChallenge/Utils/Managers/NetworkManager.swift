//
//  NetworkManager.swift
//  BeBlueChallenge
//
//  Created by Aloisio Mello on 24/02/19.
//  Copyright © 2019 Aloisio Mello. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkManager{
    static func request(requestFactory : RequestFactory, completion: @escaping (Data) -> Void){
        Alamofire.request(requestFactory.url , method: requestFactory.method, parameters: requestFactory.parameters, encoding: JSONEncoding.default, headers: requestFactory.headers).validate()
            .responseData(completionHandler: {response -> Void in
                switch response.result {
                case .success(let value):
                    completion(response.data!)
                case .failure(let error):
                    print(error)
                    completion(response.data!)
                }
            })
    }
}
