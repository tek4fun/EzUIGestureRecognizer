//
//  item.swift
//  EzUIGestureRecognizer
//
//  Created by iOS Student on 1/5/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class Item:UIImageView, UIGestureRecognizerDelegate {
    //var currentScale:CGFloat = 0
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup()
    {
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
        
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchPhoto))
        self.addGestureRecognizer(pinchGesture)
        
        let rotageGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotageItem))
        rotageGesture.delegate = self
        self.addGestureRecognizer(rotageGesture)
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func onPan(panGesture: UIPanGestureRecognizer)
    {
        if (panGesture.state == .began || panGesture.state == .changed)
        {
            let point = panGesture.location(in: self.superview)
            self.center = point
        }
    }
    func pinchPhoto(pinchGestrureRecognizer: UIPinchGestureRecognizer) {
        if pinchGestrureRecognizer.state == .began ||
            pinchGestrureRecognizer.state == .changed{
            if let view = pinchGestrureRecognizer.view
            {
                view.transform = view.transform.scaledBy(x: pinchGestrureRecognizer.scale, y: pinchGestrureRecognizer.scale)
                //view.transform = CGAffineTransform(scaleX: currentScale + pinchGestrureRecognizer.scale, y: currentScale + pinchGestrureRecognizer.scale)
                
                //pinchGestrureRecognizer.scale = 0.5
                //currentScale = pinchGestrureRecognizer.scale
            }
        }
    }
    
    func rotageItem(rotageGestureRecognizer: UIRotationGestureRecognizer)
    {
        if rotageGestureRecognizer.state == .began || rotageGestureRecognizer.state == .changed
        {
            if let view = rotageGestureRecognizer.view{
                view.transform = view.transform.rotated(by: rotageGestureRecognizer.rotation)
                //view.transform = CGAffineTransform(rotationAngle: rotageGestureRecognizer.rotation )
                //rotageGestureRecognizer.rotation = 0
            }
            
        }
    }
}

