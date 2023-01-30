//
//  MainCoordinator.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

protocol Coordinator: AnyObject {

    var navigationController: UINavigationController { get }
    func startCoordinator()
}

final class MainCoordinator: Coordinator {

    let navigationController: UINavigationController

    init(
        navigationController: UINavigationController = .init()
    ) {
        self.navigationController = navigationController
    }

    func startCoordinator() {
        let vc = UIViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
