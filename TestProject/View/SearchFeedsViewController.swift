//
//  SearchFeedsViewController.swift
//  TestProject
//
//  Created by Yura on 11/25/18.
//  Copyright © 2018 Yura. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchFeedsViewController: UITableViewController {
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    private let disposeBag = DisposeBag()
    private var viewModel: PaginationViewModel<Feed>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseRequest = FeedAPI.SearchRepositoriesRequest(query: "story")
        
        viewModel = PaginationViewModel(
            baseRequest: baseRequest,
            viewWillAppear: rx.viewWillAppear.asDriver(),
            scrollViewDidReachBottom: tableView.rx.reachedBottom.asDriver())
        
        disposeBag.insert([
            viewModel.indicatorViewAnimating.drive(indicatorView.rx.isAnimating),
            viewModel.elements.drive(tableView.rx.items(cellIdentifier: "Cell", cellType: FeedCell.self)),
            viewModel.loadError.drive(onNext: { print($0) }),
            ])
    }
}
