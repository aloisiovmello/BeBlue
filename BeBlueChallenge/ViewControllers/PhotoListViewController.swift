//
//  PhotoListViewController.swift
//  BeBlueChallenge
//
//  Created by Aloisio Mello on 24/02/19.
//  Copyright © 2019 Aloisio Mello. All rights reserved.
//

import UIKit
import SDWebImage_ProgressView
import NVActivityIndicatorView

protocol PhotoListViewControllerDelegate : class{
    func roverPhotoSelected(photo : Photo)
}

class PhotoListViewController: UIViewController, PhotoListViewModelDelegate {
    @IBOutlet weak var collectionView : UICollectionView!
    var delegate : PhotoListViewControllerDelegate!
    var datasource : PhotoList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }

    func setup(){
        self.collectionView.register(UINib.init(nibName: "RoverImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "roverImagesCell")
        executeRequestTasks(delegate: self, rover: .Curiosity, date: nil)
    }
    
    func updateInterface(photoList: PhotoList) {
        self.datasource = photoList
        collectionView.reloadData()
        stopAnimating()
    }
    
    @IBAction func segmentedIndexHasChanged(sender : UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            executeRequestTasks(delegate: self, rover: .Curiosity, date: nil)
        case 1:
            executeRequestTasks(delegate: self, rover: .Opportunity, date: nil)
        case 2:
            executeRequestTasks(delegate: self, rover: .Spirit, date: nil)
        default:
            executeRequestTasks(delegate: self, rover: .Curiosity, date: nil)
        }
    }
    
    // MARK: - Function to unificate how we can download all the informations
    func executeRequestTasks(delegate : PhotoListViewModelDelegate, rover : Rover, date : String?){
        let size = CGSize(width: 42, height: 42)
        startAnimating(size, message: "Please wait while we get all your amazing photos from mars!", type: NVActivityIndicatorType(rawValue: NVActivityIndicatorType.ballGridBeat.rawValue)!)
        
        self.datasource = nil
        PhotoListViewModel.request(delegate: delegate, rover: rover, date: date)
        collectionView.reloadData()
    }
}

extension PhotoListViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if datasource != nil{
            return datasource.photos.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let roverImages = collectionView.dequeueReusableCell(withReuseIdentifier: "roverImagesCell", for: indexPath) as! RoverImagesCollectionViewCell
        let photo = datasource.photos[indexPath.row]
        
        roverImages.roverImageView.sd_setImage(with: URL.init(string: photo.img_src), completed: { (image, error, cacheType, url) in
            if error != nil{
                print("Unable to download the image \(String(describing: url))")
            }
        }, using: roverImages.progressBar)
        
        return roverImages
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = datasource.photos[indexPath.row]
        delegate.roverPhotoSelected(photo: photo)
    }
}

extension PhotoListViewController : NVActivityIndicatorViewable{
    
}
