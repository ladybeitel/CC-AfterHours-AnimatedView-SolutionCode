//
//  AnimatedViewController.swift
//  AnimatedView
//
//  Created by Ciara Beitel on 1/21/20.
//  Copyright © 2020 Ciara Beitel. All rights reserved.
//

// SOLUTION CODE

import UIKit

class AnimatedViewController: UIViewController {
    
    @IBOutlet weak var catImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        zoomCat()
    }
    
    func zoomCat() {
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseIn, animations: {
            self.catImageView.transform = CGAffineTransform(scaleX: 14.0, y: 14.0)
        }) { (_) in
            print("Zooming on cat.")
        }
        UIView.animate(withDuration: 0.8, delay: 1.0, options: .curveEaseIn, animations: {
            self.catImageView.alpha = 0.0
        }) { (_) in
            print("Fading out.")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
            self.performSegue(withIdentifier: "ShowMainScreen", sender: nil)
        })
    }
}
