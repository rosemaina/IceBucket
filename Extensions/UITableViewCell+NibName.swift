//
//  UITableViewCell+NibName.swift
//  IceBucket
//
//  Created by Rose Maina on 31/08/2018.
//  Copyright © 2018 Rose Maina. All rights reserved.
//

import Foundation
import UIKit

public protocol NibLoadable {
    static var reuseIdentifier: String{get}
    static var nibName: String{get}
}

extension NibLoadable where Self: UITableViewCell {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    public static var nibName: String {
        return String(describing: self)
    }
}
