//
//  PhotoListViewModel.swift
//  BeBlueChallenge
//
//  Created by Aloisio Mello on 24/02/19.
//  Copyright © 2019 Aloisio Mello. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

protocol PhotoListViewModelDelegate : class{
    func updateInterface(photoList : PhotoList)
}

class PhotoListViewModel{
    static func request(delegate : PhotoListViewModelDelegate, rover : Rover, date:String?){
        
        var currentDate : String
        if date == nil{
            //I don't received any date, that's a sign to get today's information
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-mm-dd"
            let today = Date()
            currentDate = formatter.string(from: today)
        }else{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-mm-dd"
            let convertedDate = formatter.date(from: date!)
            
            let calendar = Calendar.init(identifier: .gregorian)
            let lessOneDay = calendar.date(byAdding: .day, value: -1, to: convertedDate!)
            
            
            currentDate = formatter.string(from: lessOneDay!)
        }
        
        let request = PhotoListRequestHelper(rover: rover, date: currentDate)
        let manager = NetworkManager.request(requestFactory: request.requestFactory) { (data) in
            if data is Error{
                print("deu erro ao fazer o request")
            }else{
                let photoList = try? JSONDecoder().decode(PhotoList.self, from: data)
                if (photoList?.photos.count == 0 || photoList == nil){
                    PhotoListViewModel.request(delegate: delegate, rover: rover, date: currentDate)
                }else{
                    delegate.updateInterface(photoList: photoList!)
                }
            }
        }
    }
}
