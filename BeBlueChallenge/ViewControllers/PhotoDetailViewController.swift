//
//  PhotoDetailViewController.swift
//  BeBlueChallenge
//
//  Created by Aloisio Mello on 24/02/19.
//  Copyright © 2019 Aloisio Mello. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var photoImage : UIImageView!
    @IBOutlet weak var progressBar : UIProgressView!
    
    var photo : Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }

    func setup(){
        self.nameLabel.text = photo.camera.name
        self.photoImage.sd_setImage(with: URL.init(string: photo.img_src), completed: { (image, error, cacheType, url) in
            if error != nil{
                print("Unable to download the image \(String(describing: url))")
            }
        }, using: self.progressBar)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
