//
//  GRLayoutHelper.swift
//  GRLayout
//
//  Created by 希 Guan on 2016/12/13.
//  Copyright © 2016年 ower[]. All rights reserved.
//

import UIKit

struct ConstraintInfo {
     var attribute: NSLayoutAttribute = .left
     var secondAttribute: NSLayoutAttribute = .notAnAttribute
     var constant: CGFloat = 0
     var identifier: String?
     var relation: NSLayoutRelation = .equal
}


//自定义运算符   https://github.com/apple/swift-evolution/blob/master/proposals/0077-operator-precedence.md
precedencegroup Constraint {
    associativity: left  //left，right,none
    higherThan: AssignmentPrecedence  //
}
//prefix infix postfix
infix operator ||| : Constraint

//
@discardableResult
func ||| <T: UIView> (left: (T,T),block: (inout ConstraintInfo) -> Void) ->NSLayoutConstraint  {
    
    var info = ConstraintInfo()
    block(&info)
    info.secondAttribute = info.secondAttribute == .notAnAttribute ? info.attribute : info.secondAttribute
    
    let constraint = NSLayoutConstraint(item: left.1,
                                        attribute: info.attribute,
                                        relatedBy: info.relation,
                                        toItem: left.0,
                                        attribute: info.secondAttribute,
                                        multiplier: 1,
                                        constant: info.constant)
    constraint.identifier = info.identifier
    left.0.addConstraint(constraint)
    return constraint
}

@discardableResult
func ||| <T: UIView> (left: T, block: (inout ConstraintInfo) -> Void) -> NSLayoutConstraint {
    var info = ConstraintInfo()
    block(&info)
    let constraint = NSLayoutConstraint(item: left,
                                        attribute: info.attribute,
                                        relatedBy: info.relation,
                                        toItem: nil,
                                        attribute: info.attribute,
                                        multiplier: 1,
                                        constant: info.constant)
    constraint.identifier = info.identifier
    left.addConstraint(constraint)
    return constraint
}

@discardableResult
func ||| <T: UIView> (left: (T, T, T), block: (inout ConstraintInfo) -> Void) -> NSLayoutConstraint {
    var info = ConstraintInfo()
    block(&info)
    info.secondAttribute = info.secondAttribute == .notAnAttribute ? info.attribute : info.secondAttribute
    
    let constraint = NSLayoutConstraint(item: left.1,
                                        attribute: info.attribute,
                                        relatedBy: info.relation,
                                        toItem: left.2,
                                        attribute: info.secondAttribute,
                                        multiplier: 1,
                                        constant: info.constant)
    constraint.identifier = info.identifier
    left.0.addConstraint(constraint)
    return constraint
}

//MARK:
extension UIView {
    
    func addScaleToFillConstratinsOnView(_ view: UIView) {
        [NSLayoutAttribute.left, .right, .top, .bottom].forEach { attribute in
            (self, view) ||| {
                $0.attribute = attribute
                return
            }
        }
    }
    
    func getConstraint(_ attributes: NSLayoutAttribute) -> NSLayoutConstraint? {
        return constraints.filter {
            if $0.firstAttribute == attributes && $0.secondItem == nil {
                return true
            }
            return false
            }.first
    }
}








