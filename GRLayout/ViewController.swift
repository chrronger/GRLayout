//
//  ViewController.swift
//  GRLayout
//
//  Created by 希 Guan on 2016/12/13.
//  Copyright © 2016年 ower[]. All rights reserved.
//

import UIKit

internal func Init<T> (_ type: T,block:(_ object: T) ->Void) ->T {
    block(type)
    return type
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       /*
        let redLabel = Init(UILabel(frame: .zero)) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor.red
            $0.text = "label1"
            $0.textAlignment = .center
        }
        view.addSubview(redLabel)
        //add constraints
        [NSLayoutAttribute.top,.bottom,.left,.right].forEach { (attribute) in
            (view,redLabel) ||| {
                $0.attribute = attribute
                return
            }
        }
         */
       
        //和当前View同frame
        let redLabel = creatLabele(view, color: .red, text: "redLabel")
        [NSLayoutAttribute.top,.bottom,.left,.right].forEach { (attribute) in
            (view,redLabel) ||| {
                $0.attribute = attribute
                return
            }
        }
        
        //blueLabel宽高100
        let blueLabel = creatLabele(view, color: .blue, text: "blueLabel")
        [NSLayoutAttribute.height, .width].forEach { (attribute) in
            blueLabel ||| {
                $0.attribute = attribute
                $0.constant = 100
                return
            }
        }
        //blueLabel距离左，上各20
        [NSLayoutAttribute.left, .top].forEach { (attribute) in
            (view,blueLabel) ||| {
                $0.attribute = attribute
                $0.constant = 20
                return
            }
        }
        //和blueLabel同宽高
        let orangeLabel = creatLabele(view, color: .orange, text: "orangeLabel")
        [(NSLayoutAttribute.width, 100),(.height,100)].forEach { (info) in
            orangeLabel ||| {
                $0.attribute = info.0
                $0.constant = CGFloat(info.1)
                return
            }
        }
        //orangeLabel距离右上各20
        [(NSLayoutAttribute.right,-20), (.top,20)].forEach { (info) in
            (view,orangeLabel) ||| {
                $0.attribute = info.0
                $0.constant = CGFloat(info.1)
                return
            }
        }
        
        let purpleLabel = creatLabele(view, color: .purple, text: "purpleLabel")
        [(NSLayoutAttribute.bottom,-20),(.left,20)].forEach { (info) in
            (view,purpleLabel) ||| {
                $0.attribute = info.0
                $0.constant = CGFloat(info.1)
                return
            }
        }
        [(NSLayoutAttribute.width,100),(.height,100)].forEach { (info) in
            purpleLabel ||| {
                $0.attribute = info.0
                $0.constant = CGFloat(info.1)
            }
        }
        
        let whiteLabel = creatLabele(view, color: .white, text: "whiteLabel")
        [(NSLayoutAttribute.width,100),(.height,100)].forEach { (info) in
            whiteLabel ||| {
                $0.attribute = info.0
                $0.constant = CGFloat(info.1)
            }
        }
        [(NSLayoutAttribute.bottom,-20),(.right,-20)].forEach { (info) in
           (view,whiteLabel) ||| {
                $0.attribute = info.0
                $0.constant = CGFloat(info.1)
            }
        }
        
        let brownLabel = creatLabele(view, color: .brown, text: "brownLabel")

        [NSLayoutAttribute.centerX, .centerY].forEach { (attribute) in
            (view,brownLabel) ||| {
                $0.attribute = attribute
                return
            }
        }

        [(NSLayoutAttribute.width,100),(.height,100)].forEach { (info) in
            brownLabel ||| {
                $0.attribute = info.0
                $0.constant = CGFloat(info.1)
            }
        }
        
        let blackLabel = creatLabele(view, color: .black, text: "blackLabel")
        [(NSLayoutAttribute.centerX,50), (.centerY,50)].forEach { (info) in
            (view,blackLabel) ||| {
                $0.attribute = info.0
                $0.constant = CGFloat(info.1)
                return
            }
        }
        
        [(NSLayoutAttribute.width,100),(.height,100)].forEach { (info) in
            blackLabel ||| {
                $0.attribute = info.0
                $0.constant = CGFloat(info.1)
            }
        }

    }

    func creatLabele(_ onView: UIView, color: UIColor,text: String) -> UILabel {
        let label = Init(UILabel(frame: .zero)) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = color
            $0.textAlignment = .center
            $0.text = text
            
        }
        
        onView.addSubview(label)
        return label
    }


}

