//
//  CardsViewController.swift
//  Tinder
//
//  Created by Joseph Davey on 3/4/18.
//  Copyright © 2018 Joseph Davey. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var panView: UIView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didPanView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == .began {
            cardInitialCenter = panView.center
            print("Hello")
        } else if sender.state == .changed {
            if sender.location(ofTouch: 0, in: view).y >= panView.frame.height/2 {
                panView.transform = CGAffineTransform(translationX: translation.x, y: 0)
                panView.transform = panView.transform.rotated(by: CGFloat(-Double(translation.x)/10 * Double.pi / 180))
            } else {
                panView.transform = CGAffineTransform(translationX: translation.x, y: 0)
                panView.transform = panView.transform.rotated(by: CGFloat(Double(translation.x)/10 * Double.pi / 180))
            }
        } else if sender.state == .ended {
            if (translation.x > 100) {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.panView.transform = CGAffineTransform(translationX: velocity.x * 100, y: 0)
                }, completion: nil)
            } else {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.panView.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
            }
        }
    }
    
    
    @IBAction func didTapImage(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "profileSegue"){
            let profileDetails = segue.destination as! ProfileViewController
            profileDetails.image = self.imageView.image
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
