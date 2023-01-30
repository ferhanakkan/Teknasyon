//
//  HomeViewModelTests.swift
//  TeknasyonTests
//
//  Created by Ferhan Akkan on 30.01.2023.
//

@testable import Teknasyon
import XCTest

final class HomeViewModelTests: XCTestCase {

    // MARK: Properties

    var mockHomeRepository: MockHomeRepository!
    var mockHomeController: MockHomeController!
    var mockCoordinator: MockCoordinator!
    var viewModel: HomeViewModelInput!

    // MARK: SetUp

    override func setUp() {
        super.setUp()

        mockCoordinator = .init()
        mockHomeRepository = .init()
        mockHomeController = .init()
        viewModel = HomeViewModel(
            homeRepository: mockHomeRepository,
            coordinator: mockCoordinator
        )
        viewModel.outputDelegate = mockHomeController
    }

    func testDetailViewModel_ViewDidLoad_Success() {
        XCTAssertEqual(mockCoordinator.invokeShowDetailsCount, .zero)
        XCTAssertEqual(mockCoordinator.invokeStartCoordinatorCount, .zero)
        XCTAssertEqual(mockHomeController.invokeReloadTableViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeFooterViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowAlertCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowLoadingCount, .zero)
        XCTAssertEqual(mockHomeController.invokeHideLoadingCount, .zero)
        XCTAssertNil(mockHomeRepository.activeRequest)
        XCTAssertTrue(viewModel.datas.isEmpty)

        viewModel.viewDidLoad()

        XCTAssertEqual(mockCoordinator.invokeShowDetailsCount, .zero)
        XCTAssertEqual(mockCoordinator.invokeStartCoordinatorCount, .zero)
        XCTAssertEqual(mockHomeController.invokeReloadTableViewCount, 1)
        XCTAssertEqual(mockHomeController.invokeFooterViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowAlertCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowLoadingCount, 1)
        XCTAssertEqual(mockHomeController.invokeHideLoadingCount, 1)
        XCTAssertNil(mockHomeRepository.activeRequest)
        XCTAssertTrue(viewModel.datas.isEmpty)
    }

    func testDetailViewModel_DidSelectAt_Success() {
        XCTAssertEqual(mockCoordinator.invokeShowDetailsCount, .zero)
        XCTAssertEqual(mockCoordinator.invokeStartCoordinatorCount, .zero)
        XCTAssertEqual(mockHomeController.invokeReloadTableViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeFooterViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowAlertCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowLoadingCount, .zero)
        XCTAssertEqual(mockHomeController.invokeHideLoadingCount, .zero)
        XCTAssertNil(mockHomeRepository.activeRequest)
        XCTAssertTrue(viewModel.datas.isEmpty)

        viewModel.fetchData(isInitial: false)
        viewModel.didSelectedAt(indexPath: .init(row: .zero, section: .zero))

        XCTAssertEqual(mockCoordinator.invokeShowDetailsCount, 1)
        XCTAssertEqual(mockCoordinator.invokeStartCoordinatorCount, .zero)
        XCTAssertEqual(mockHomeController.invokeReloadTableViewCount, 1)
        XCTAssertEqual(mockHomeController.invokeFooterViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowAlertCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowLoadingCount, .zero)
        XCTAssertEqual(mockHomeController.invokeHideLoadingCount, .zero)
        XCTAssertNil(mockHomeRepository.activeRequest)
        XCTAssertTrue(viewModel.datas.isNotEmpty)
    }

    func testDetailViewModel_DidChangeRefreshValue_Success() {
        XCTAssertEqual(mockCoordinator.invokeShowDetailsCount, .zero)
        XCTAssertEqual(mockCoordinator.invokeStartCoordinatorCount, .zero)
        XCTAssertEqual(mockHomeController.invokeReloadTableViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeFooterViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowAlertCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowLoadingCount, .zero)
        XCTAssertEqual(mockHomeController.invokeHideLoadingCount, .zero)
        XCTAssertNil(mockHomeRepository.activeRequest)
        XCTAssertTrue(viewModel.datas.isEmpty)

        viewModel.fetchData(isInitial: false)
        viewModel.didChangeRefreshValue(isRefreshing: true)

        XCTAssertEqual(mockCoordinator.invokeShowDetailsCount, .zero)
        XCTAssertEqual(mockCoordinator.invokeStartCoordinatorCount, .zero)
        XCTAssertEqual(mockHomeController.invokeReloadTableViewCount, 2)
        XCTAssertEqual(mockHomeController.invokeFooterViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowAlertCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowLoadingCount, .zero)
        XCTAssertEqual(mockHomeController.invokeHideLoadingCount, 1)
        XCTAssertNil(mockHomeRepository.activeRequest)
        XCTAssertTrue(viewModel.datas.isEmpty)
    }

    func testDetailViewModel_WillDisplayCellAt_Success() {
        XCTAssertEqual(mockCoordinator.invokeShowDetailsCount, .zero)
        XCTAssertEqual(mockCoordinator.invokeStartCoordinatorCount, .zero)
        XCTAssertEqual(mockHomeController.invokeReloadTableViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeFooterViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowAlertCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowLoadingCount, .zero)
        XCTAssertEqual(mockHomeController.invokeHideLoadingCount, .zero)
        XCTAssertNil(mockHomeRepository.activeRequest)
        XCTAssertTrue(viewModel.datas.isEmpty)

        viewModel.fetchData(isInitial: false)
        viewModel.willDisplayCellAt(indexPath: .init(row: .zero, section: .zero))

        XCTAssertEqual(mockCoordinator.invokeShowDetailsCount, .zero)
        XCTAssertEqual(mockCoordinator.invokeStartCoordinatorCount, .zero)
        XCTAssertEqual(mockHomeController.invokeReloadTableViewCount, 1)
        XCTAssertEqual(mockHomeController.invokeFooterViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowAlertCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowLoadingCount, .zero)
        XCTAssertEqual(mockHomeController.invokeHideLoadingCount, .zero)
        XCTAssertNil(mockHomeRepository.activeRequest)
        XCTAssertTrue(viewModel.datas.isNotEmpty)
    }

    func testDetailViewModel_WillDisplayCellAt_Failure() {
        XCTAssertEqual(mockCoordinator.invokeShowDetailsCount, .zero)
        XCTAssertEqual(mockCoordinator.invokeStartCoordinatorCount, .zero)
        XCTAssertEqual(mockHomeController.invokeReloadTableViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeFooterViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowAlertCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowLoadingCount, .zero)
        XCTAssertEqual(mockHomeController.invokeHideLoadingCount, .zero)
        XCTAssertNil(mockHomeRepository.activeRequest)
        XCTAssertTrue(viewModel.datas.isEmpty)

        viewModel.willDisplayCellAt(indexPath: .init(row: 100, section: .zero))

        XCTAssertEqual(mockCoordinator.invokeShowDetailsCount, .zero)
        XCTAssertEqual(mockCoordinator.invokeStartCoordinatorCount, .zero)
        XCTAssertEqual(mockHomeController.invokeReloadTableViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeFooterViewCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowAlertCount, .zero)
        XCTAssertEqual(mockHomeController.invokeShowLoadingCount, .zero)
        XCTAssertEqual(mockHomeController.invokeHideLoadingCount, .zero)
        XCTAssertNil(mockHomeRepository.activeRequest)
        XCTAssertTrue(viewModel.datas.isEmpty)
    }

    // MARK: TearDown

    override func tearDown() {
        super.tearDown()

        mockCoordinator = nil
        mockHomeRepository = nil
        mockHomeController = nil
        viewModel = nil
    }
}
