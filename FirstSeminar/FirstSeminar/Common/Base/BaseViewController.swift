//
//  BaseViewController.swift
//  FirstSeminar
//
//  Created by RAFA on 10/6/24.
//

import UIKit

import SnapKit
import Then

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setStyle()
        setUI()
        setAutoLayout()
    }

    /// UI 요소의 스타일을 설정합니다.
    func setStyle() { }

    /// UI 구성 요소를 추가합니다.
    func setUI() { }

    /// UI 요소들의 레이아웃을 설정합니다.
    func setAutoLayout() { }
}
