//
//  ViewController.swift
//  EzUIGestureRecognizer
//
//  Created by iOS Student on 1/5/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tapGesture)
    }
    func onTap(tapGesture: UITapGestureRecognizer)
    {
        let point = tapGesture.location(in: self.view)
        let snowFlake = UIImageView(image: UIImage (named: "snowflake.png"))
        snowFlake.bounds.size = CGSize(width: 40, height: 40)
        snowFlake.center = point
        self.view.addSubview(snowFlake)
    }

    
    

}

