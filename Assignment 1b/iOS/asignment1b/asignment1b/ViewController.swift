//
//  ViewController.swift
//  asignment1b
//
//  Created by Jacob Rozell on 5/28/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func auburnAction(_ sender: Any) {
        imageView.image = #imageLiteral(resourceName: "auburn")
    }
    
    @IBAction func bamaButton(_ sender: Any) {
        imageView.image = #imageLiteral(resourceName: "bama")
    }
    
    @IBAction func secButton(_ sender: Any) {
        imageView.image = #imageLiteral(resourceName: "sec")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = #imageLiteral(resourceName: "sec")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

