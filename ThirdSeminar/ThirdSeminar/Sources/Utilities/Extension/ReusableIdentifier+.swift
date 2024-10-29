//
//  ReusableIdentifier+.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/27/24.
//

import UIKit

protocol ReusableIdentifier: AnyObject { }

extension ReusableIdentifier where Self: UIView {

    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReusableIdentifier { }
