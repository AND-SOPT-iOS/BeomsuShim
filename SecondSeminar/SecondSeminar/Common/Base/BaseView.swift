//
//  BaseView.swift
//  SecondSeminar
//
//  Created by RAFA on 10/13/24.
//

import UIKit

import SnapKit
import Then

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemBackground

        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// UI 요소의 스타일을 설정합니다.
    func setStyle() { }

    /// UI 구성 요소를 추가합니다.
    func setUI() { }

    /// UI 요소들의 레이아웃을 설정합니다.
    func setLayout() { }
}
