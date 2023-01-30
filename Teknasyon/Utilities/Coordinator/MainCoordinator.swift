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
    func showDetails(with id: Int)
}

final class MainCoordinator: Coordinator {

    // MARK: Properties

    let navigationController: UINavigationController

    // MARK: Initilizer

    init(navigationController: UINavigationController = .init()) {
        self.navigationController = navigationController
    }

    func startCoordinator() {
        let vc = HomeController(viewModel: HomeViewModel(coordinator: self))
        navigationController.pushViewController(vc, animated: true)
    }

    func showDetails(with id: Int) {
        let vc = DetailController(viewModel: DetailViewModel(id: id))
        navigationController.show(vc, sender: nil)
    }
}
