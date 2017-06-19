//
//  CustomScrollView.swift
//  SimpleCD
//
//  Created by Santosh Pawar on 6/18/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit

class CustomScrollView: UIView {

    //MARK: - Init methods -
    override init(frame: CGRect) {
        super.init(frame: frame)
        addgestureToCustomScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addgestureToCustomScrollView()
    }
    
    var contentSize: CGSize?
    
    private func addgestureToCustomScrollView() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        self.addGestureRecognizer(panGestureRecognizer)
    }
    
     func handlePanGesture(gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translationInView(self)
        var bounds = self.bounds
        
        //Translate the view's bounds, but do not permit values that would violate contentSize
        let newBoundsOriginX = bounds.origin.x - translation.x
        let minBoundsOriginX = CGFloat(0.0)
        let maxBoundsOriginX = (self.contentSize?.width)! - bounds.size.width
        bounds.origin.x = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX)) as CGFloat
        
        let newBoundsOriginY = bounds.origin.y - translation.y
        let minBoundsOriginY = CGFloat(0.0)
        let maxBoundsOriginY = (self.contentSize?.height)! - bounds.size.width
        bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY)) as CGFloat
        
        self.bounds = bounds
        gesture.setTranslation(CGPointZero, inView: self)
    }
}
