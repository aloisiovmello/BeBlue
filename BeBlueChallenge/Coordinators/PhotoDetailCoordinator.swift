//
//  PhotoDetailCoordinator.swift
//  BeBlueChallenge
//
//  Created by Aloisio Mello on 24/02/19.
//  Copyright © 2019 Aloisio Mello. All rights reserved.
//

import UIKit

class PhotoDetailCoordinator : Coordinator{
    private let presenter : UINavigationController
    private let photo : Photo
    private var photoDetailViewController : PhotoDetailViewController?
    
    init(presenter : UINavigationController, photo : Photo){
        self.presenter = presenter
        self.photo = photo
    }
    
    func start() {
        let photoDetailViewController = PhotoDetailViewController.init(nibName: nil, bundle: nil)
        photoDetailViewController.photo = self.photo
        
        self.presenter.pushViewController(photoDetailViewController, animated: true)
        self.photoDetailViewController = photoDetailViewController
    }
}
