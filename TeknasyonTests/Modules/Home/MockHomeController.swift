//
//  MockHomeController.swift
//  TeknasyonTests
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
@testable import Teknasyon
import XCTest

final class MockHomeController: XCTestCase, HomeViewModelOutput {

    // MARK: Properties

    var invokeReloadTableViewCount: Int = 0
    var invokeFooterViewCount: Int = 0
    var invokeEndRefreshControlRefreshingCount: Int = 0
    var invokeShowAlertCount: Int = 0
    var invokeShowLoadingCount: Int = 0
    var invokeHideLoadingCount: Int = 0
}

// MARK: Publics

extension MockHomeController {

    func reloadTableView(completion: @escaping VoidCompletion) {
        invokeReloadTableViewCount += 1
    }

    func setFooterView(isLoadingEnable: Bool) {
        invokeFooterViewCount += 1
    }

    func insertTableViewRows(in range: ClosedRange<Int>) {
        invokeReloadTableViewCount += 1
    }

    func endRefreshControlRefreshing() {
        invokeEndRefreshControlRefreshingCount += 1
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
