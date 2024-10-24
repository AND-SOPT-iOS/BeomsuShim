//
//  UITextView+WriteReview.swift
//  SecondSeminar
//
//  Created by RAFA on 10/17/24.
//

import UIKit

extension UITextView {

    func configureWriteReviewTextView() {
        self.text = "선택 사항"
        self.textColor = .systemGray2
        self.backgroundColor = .clear
        self.font = .systemFont(ofSize: 17, weight: .medium)
        self.isScrollEnabled = false
        self.textContainerInset = .zero
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.spellCheckingType = .no
    }
}
