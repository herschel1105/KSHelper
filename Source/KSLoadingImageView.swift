//
//  KSLoadingImageView.swift
//
//  Created by Saito Keigo on 7/5/19.
//  Copyright © 2019 Keigo Saito. All rights reserved.
//

import UIKit

var cache = NSCache<AnyObject, AnyObject>()

open class KSLoadingImageView: UIImageView {
    
    
    private var imageUrlString: String?
    
    public func loadAndCacheImageWith( imageUrl: String) {
        self.imageUrlString = imageUrl
        
        let url = URL(string: imageUrl)
        
        image = nil
        
        if let image = cache.object(forKey: imageUrl as AnyObject) as? UIImage {
            self.image = image
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, err) in
            if err != nil {
                print(err!)
                return
            }
            
            
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                if self.imageUrlString == imageUrl {
                    self.image = image
                }
                cache.setObject(image!, forKey: imageUrl as AnyObject)
            }
            
        }).resume()
        
    }
}
