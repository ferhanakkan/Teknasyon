//
//  CustomAlertController.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

final class CustomAlertController: UIAlertController {

    var dismissHandler: (() -> Void)?

    override func viewDidDisappear(_ animated: Bool) {
        dismissHandler?()
        super.viewDidDisappear(animated)
    }
}
