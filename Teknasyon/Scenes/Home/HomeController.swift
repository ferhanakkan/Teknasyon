//
//  HomeController.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
import UIKit

final class HomeController: UIViewController {

    // MARK: Properties

    private lazy var tableView: UITableView = { [weak self] in
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(type: TvShowListingTableViewCell.self)
        tableView.backgroundColor = .white
        tableView.refreshControl = refreshControl
        return tableView
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(didChangeRefreshValue), for: .valueChanged)
        return view
    }()

    private let viewModel: HomeViewModelInput

    // MARK: Initilizer

    init(viewModel: HomeViewModelInput) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        viewModel.outputDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
        configureLayout()
    }
}

// MARK: TableView Delegate & DataSource

extension HomeController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.datas[indexPath.row]
        let cell: TvShowListingTableViewCell = tableView.dequeueCell(
            withType: TvShowListingTableViewCell.self
        )
        cell.configure(with: data)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectedAt(indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.willDisplayCellAt(indexPath: indexPath)
    }
}

// MARK: HomeViewModelOutput

extension HomeController: HomeViewModelOutput {

    func reloadTableView(completion: @escaping FAFoundation.VoidCompletion) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData(completion: completion)
        }
    }

    func insertTableViewRows(in range: ClosedRange<Int>) {
        let indexPaths = range.map({ IndexPath(row: $0, section: .zero) })
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            UIView.performWithoutAnimation {
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: indexPaths, with: .none)
                self.tableView.endUpdates()
            }
        }
    }

    func setFooterView(isLoadingEnable: Bool) {
        DispatchQueue.main.async { [weak self] in
            let view = ActivityIndicatorContainerView(
                frame: .init(
                    x: .zero,
                    y: .zero,
                    width: UIScreen.main.bounds.width,
                    height: 60
                )
            )
            view.startAnimating()

            self?.tableView.tableFooterView = isLoadingEnable ?
            view :
            nil
        }
    }

    func endRefreshControlRefreshing() {
        DispatchQueue.main.async { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
}

// MARK: Privates

private extension HomeController {

    func configureLayout() {
        title = "Home"

        view.backgroundColor = .white

        view.addSubview(tableView)
        tableView.pinToSafeSuperView()
    }
}

// MARK: Actions

private extension HomeController {

    @objc func didChangeRefreshValue() {
       viewModel.didChangeRefreshValue(isRefreshing: refreshControl.isRefreshing)
    }
}
