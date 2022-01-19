//
//  ViewController.swift
//  Patterns-Flyweight
//
//  Created by Ruslan on 19.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // the same addresses
        let firstRedColor = UIColor.red
        let secondRedColor = UIColor.red
        print(firstRedColor === secondRedColor)
        
        // different addresses
        let firstRedColorRGB = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        let secondRedColorRGB = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        print(firstRedColorRGB === secondRedColorRGB)
        
        // flyweight example
        let firstFlyRedColor = UIColor.flyRGB(1, 0, 0, 1)
        let secondFlyRedColor = UIColor.flyRGB(1, 0, 0, 1)
        print(firstFlyRedColor === secondFlyRedColor)
    }
}

extension UIColor {
     
    static var colorStore = [String: UIColor]()
    
    class func flyRGB(_ red: CGFloat,
                      _ green: CGFloat,
                      _ blue: CGFloat,
                      _ alpha: CGFloat) -> UIColor {
        
        let key = "\(red)\(blue)\(green)\(alpha)"
        if let color = colorStore[key] {
            return color
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        colorStore[key] = color
        return color
    }
}

