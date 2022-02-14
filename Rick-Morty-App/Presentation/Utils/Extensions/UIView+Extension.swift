//
//  UIView+Extension.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import UIKit
protocol ReusableView: AnyObject {  static var reuseIdentifier: String { get} }
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: AnyObject { static var nibName: String { get} }
extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
