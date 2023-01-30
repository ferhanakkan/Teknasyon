//
//  MockDetailController.swift
//  TeknasyonTests
//
//  Created by Ferhan Akkan on 30.01.2023.
//

@testable import Teknasyon
import XCTest

final class MockDetailController: XCTestCase, DetailViewModelOutput {

    // MARK: Properties

    var invokeUpdateDetailContainerCount: Int = 0
    var invokeShowAlertCount: Int = 0
    var invokeShowLoadingCount: Int = 0
    var invokeHideLoadingCount: Int = 0
}

// MARK: Publics

extension MockDetailController {

    func updateDetailContainer(with viewModel: DetailContainerViewModel) {
        invokeUpdateDetailContainerCount += 1
    }

    func showAlert(with message: String) {
        invokeShowAlertCount += 1
    }

    func showLoading() {
        invokeShowLoadingCount += 1
    }

    func hideLoading() {
        invokeHideLoadingCount += 1
    }
}
