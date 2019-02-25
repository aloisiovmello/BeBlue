//
//  PhotoListCoordinator.swift
//  BeBlueChallenge
//
//  Created by Aloisio Mello on 24/02/19.
//  Copyright © 2019 Aloisio Mello. All rights reserved.
//

import UIKit

class PhotoListCoordinator : Coordinator{
    private let presenter : UINavigationController
    private var photoListViewController : PhotoListViewController?
    private var photoDetailCoordinator : PhotoDetailCoordinator?
    init(presenter : UINavigationController){
        self.presenter = presenter
    }
    
    func start() {
        let photoListViewController = PhotoListViewController(nibName: nil, bundle: nil)
        photoListViewController.delegate = self
        presenter.pushViewController(photoListViewController, animated: true)
        self.photoListViewController = photoListViewController
    }
}

extension PhotoListCoordinator : PhotoListViewControllerDelegate{
    func roverPhotoSelected(photo: Photo) {
        let photoDetailCoordinator = PhotoDetailCoordinator(presenter: presenter, photo: photo)
        photoDetailCoordinator.start()
        self.photoDetailCoordinator = photoDetailCoordinator
    }
    
}
