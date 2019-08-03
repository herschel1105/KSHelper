//
//  Extensions.swift
//  KSHelper
//
//  Created by Saito Keigo on 7/9/19.
//

import UIKit

public extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

public extension UIView {
    enum linePosition {
        case top
        case bottom
    }
    func addLine(position : linePosition, color: UIColor, height: CGFloat, widthMultiplier: CGFloat) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineView)
        if #available(iOS 9.0, *) {
            lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            lineView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: widthMultiplier).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: height).isActive = true
            switch position {
            case .top:
                lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                break
            case .bottom:
                lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                break
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
}

public extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

public extension UITextField {
    class func connectFields(fields:[UITextField]) -> Void {
        guard let last = fields.last else {
            return
        }
        for i in 0 ..< fields.count - 1 {
            fields[i].returnKeyType = .next
            fields[i].addTarget(fields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
        }
        last.returnKeyType = .done
        last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
    }
}

public extension UIBarButtonItem {
    enum HiddenItem: Int {
        case Arrow = 100
        case Back = 101
        case Forward = 102
        case Up = 103
        case Down = 104
    }
    
    convenience init(barButtonHiddenItem: HiddenItem, target: AnyObject?, action: Selector?) {
        let systemItem = UIBarButtonItem.SystemItem(rawValue: barButtonHiddenItem.rawValue)
        self.init(barButtonSystemItem: systemItem!, target: target, action: action)
    }
}


public extension String {
    var wordCount: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+")
        return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
    }
    
    func url() -> URL {
        return URL(string: self)!
    }
}
