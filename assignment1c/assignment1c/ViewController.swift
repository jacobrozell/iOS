//
//  ViewController.swift
//  assignment1c
//
//  Created by Jacob Rozell on 6/13/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bamaImage = #imageLiteral(resourceName: "bama")
    let auburnImage = #imageLiteral(resourceName: "auburn")
    
    @IBOutlet weak var auburnImageView: UIImageView!
    @IBOutlet weak var bamaimageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderWasMoved(_ sender: UISlider) {
        let value = sender.value
        bamaimageView.alpha = CGFloat(value)
        auburnImageView.alpha = CGFloat(sender.maximumValue - value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        slider.value = 0.5
        slider.maximumValue = 1
        
        auburnImageView.image = auburnImage
        bamaimageView.image = bamaImage
        
        auburnImageView.alpha = 0.5
        bamaimageView.alpha = 0.5
    }
}

