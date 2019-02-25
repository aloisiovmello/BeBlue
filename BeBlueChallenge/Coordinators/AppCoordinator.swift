//
//  AppCoordinator.swift
//  BeBlueChallenge
//
//  Created by Aloisio Mello on 24/02/19.
//  Copyright © 2019 Aloisio Mello. All rights reserved.
//

import UIKit

class AppCoordinator : Coordinator{
    let photoListCoordinator : PhotoListCoordinator
    let rootViewController : UINavigationController
    let window : UIWindow
    
    init(window : UIWindow){
        self.window = window
        self.rootViewController = UINavigationController()
        self.photoListCoordinator = PhotoListCoordinator(presenter: rootViewController)
    }
    
    func start(){
        window.rootViewController = rootViewController
        self.photoListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
