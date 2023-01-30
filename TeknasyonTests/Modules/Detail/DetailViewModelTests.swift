//
//  DetailViewModelTests.swift
//  TeknasyonTests
//
//  Created by Ferhan Akkan on 30.01.2023.
//

@testable import Teknasyon
import XCTest

final class DetailViewModelTests: XCTestCase {

    // MARK: Properties

    var mockDetailRepository: MockDetailRepository!
    var mockDetailController: MockDetailController!
    var viewModel: DetailViewModelInput!

    // MARK: SetUp

    override func setUp() {
        super.setUp()

       mockDetailRepository = .init()
       mockDetailController = .init()
       viewModel = DetailViewModel(
            detailRepository: mockDetailRepository,
            id: .zero
        )
        viewModel.outputDelegate = mockDetailController
    }

    func testDetailViewModel_ViewDidLoad_Success() {
        XCTAssertEqual(mockDetailController.invokeUpdateDetailContainerCount, Int.zero)
        XCTAssertEqual(mockDetailController.invokeShowAlertCount, Int.zero)
        XCTAssertEqual(mockDetailController.invokeShowLoadingCount, Int.zero)
        XCTAssertEqual(mockDetailController.invokeHideLoadingCount, Int.zero)
        XCTAssertEqual(mockDetailRepository.invokeFetchDetailCount, Int.zero)
        XCTAssertNil(mockDetailRepository.activeRequest)
        XCTAssertNil(viewModel.data)

        viewModel.viewDidLoad()

        XCTAssertEqual(mockDetailController.invokeUpdateDetailContainerCount, 1)
        XCTAssertEqual(mockDetailController.invokeShowAlertCount, Int.zero)
        XCTAssertEqual(mockDetailController.invokeShowLoadingCount, 1)
        XCTAssertEqual(mockDetailController.invokeHideLoadingCount, 1)
        XCTAssertEqual(mockDetailRepository.invokeFetchDetailCount, 1)
        XCTAssertNil(mockDetailRepository.activeRequest)
        XCTAssertNotNil(viewModel.data)
    }

    // MARK: Tear Down

    override func tearDown() {
        super.tearDown()

        mockDetailRepository = nil
        mockDetailController = nil
        viewModel = nil
    }
}
