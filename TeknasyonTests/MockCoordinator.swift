//
//  MockCoordinator.swift
//  TeknasyonTests
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
@testable import Teknasyon
import XCTest

final class MockCoordinator: XCTestCase, Coordinator {

    var invokeStartCoordinatorCount: Int = 0
    var invokeShowDetailsCount: Int = 0

    var navigationController: UINavigationController = .init()

    func startCoordinator() {
        invokeStartCoordinatorCount += 1
    }

    func showDetails(with id: Int) {
        invokeShowDetailsCount += 1
    }
}
