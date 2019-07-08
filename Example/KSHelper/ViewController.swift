//
//  ViewController.swift
//  KSHelper
//
//  Created by herschel1105 on 07/08/2019.
//  Copyright (c) 2019 herschel1105. All rights reserved.
//

import UIKit
import KSHelper

class ViewController: UIViewController {
    
    let imageView: KSLoadingImageView = {
        let iv = KSLoadingImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let bounceButton: KSBounceButton = {
        let btn = KSBounceButton()
        btn.setTitle("Bounce Button", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        
//        btn.setDurationAndScale(duration: 0.3, scale: 1.2)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.loadAndCacheImageWith(imageUrl: "https://firebasestorage.googleapis.com/v0/b/news-ticker.appspot.com/o/%22LP12gOnPGOSN8SGMGskt%22%2F1.png?alt=media&token=cdca5443-ba98-4ac6-9f7c-c38bee88b7ce")
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        
        view.addSubview(bounceButton)
        bounceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bounceButton.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        bounceButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        bounceButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let phrase = "The rain in Spain"
        print(phrase.wordCount)
        
        let url = ("www.google.com").url()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

