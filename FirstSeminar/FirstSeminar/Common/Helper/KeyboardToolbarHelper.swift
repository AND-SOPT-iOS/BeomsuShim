//
//  KeyboardToolbarHelper.swift
//  FirstSeminar
//
//  Created by RAFA on 10/14/24.
//

import UIKit

class KeyboardToolbarHelper {

    static func createToolbar(
        target: Any,
        previousSelector: Selector,
        nextSelector: Selector,
        dismissSelector: Selector
    ) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let previousButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.up"),
            style: .plain,
            target: target,
            action: previousSelector
        )

        let nextButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.down"),
            style: .plain,
            target: target,
            action: nextSelector
        )

        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )

        let doneButton = UIBarButtonItem(
            title: "키보드 내리기",
            style: .plain,
            target: target,
            action: dismissSelector
        )

        toolbar.items = [previousButton, nextButton, flexSpace, doneButton]
        return toolbar
    }
}
