//
//  KSBounceButton.swift
//
//  Created by Saito Keigo on 7/5/19.
//  Copyright © 2019 Keigo Saito. All rights reserved.
//

import UIKit

open class KSBounceButton: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var duration: Double = 0.3
    var scale: CGFloat = 1.2
    
    /**
     - Parameter duration: 0.3 (default).
     - Parameter scale: 1.2 (default).
     */
    public func setDurationAndScale(duration: Double, scale: CGFloat) {
        self.duration = duration
        self.scale = scale
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.transform = CGAffineTransform(scaleX: self.scale, y: self.scale)
        
        UIView.animate(withDuration: self.duration, animations: {
            self.transform = CGAffineTransform(scaleX: self.scale, y: self.scale)
        }, completion: { _ in UIView.animate(withDuration: self.duration) {
            self.transform = CGAffineTransform.identity
            }
        })
        
        super.touchesBegan(touches, with: event)
    }
    
    
}
