//
//  UIButton+.swift
//  FirstSeminar
//
//  Created by RAFA on 10/6/24.
//

import UIKit

extension UIButton {

    func configureButton(_ title: String, titleColor: UIColor, backgroundColor: UIColor) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = backgroundColor
    }
}
