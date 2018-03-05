//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Joseph Davey on 3/5/18.
//  Copyright © 2018 Joseph Davey. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = image
    }

    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
