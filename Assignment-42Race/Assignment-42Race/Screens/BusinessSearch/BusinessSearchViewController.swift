//
//  BusinessSearchViewController.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import UIKit
import RxCocoa
import RxSwift
import Domain

class BusinessSearchViewController: BaseViewController<BusinessSearchVM> {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var btnSortDistance: UIButton!
    @IBOutlet private weak var btnSortRate: UIButton!
    private let searchController = UISearchController(searchResultsController: nil)
    
    private let onSearchTrigger = PublishSubject<String>()

    private var businesses = BehaviorRelay(value: [BussinessEnity]())

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Businesses"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        tableView.register(nib: BusinessTableViewCell.self)
        tableView.dataSource = self
    }
    
    override func bindingUI() {
        let inputs = BusinessSearchVM.Input(onSearchTrigger: onSearchTrigger)
        let outputs = viewModel.transform(input: inputs)
        
        outputs.businesses.drive(with: self, onNext: { vc, data in
            vc.businesses.accept(data)
        }).disposed(by: disposeBag)
        
        businesses
            .asDriver()
            .drive(with: self, onNext: { vc,_ in
                vc.tableView.reloadData()
            }).disposed(by: disposeBag)
        
        outputs.loadingIndicator.drive(rx.isLoading).disposed(by: disposeBag)
        outputs.errorTracker.drive(rx.error).disposed(by: disposeBag)
        
        btnSortRate.rx
            .tap
            .asDriver()
            .drive(with: self, onNext: { vc,_ in
                let data = vc.businesses.value.sorted { e1, e2 in
                    return e1.ratings > e2.ratings
                }
                vc.businesses.accept(data)
            }).disposed(by: disposeBag)
        
        btnSortDistance.rx
            .tap
            .asDriver()
            .drive(with: self, onNext: { vc,_ in
                let data = vc.businesses.value.sorted { e1, e2 in
                    return e1.distance < e2.distance
                }
                vc.businesses.accept(data)
            }).disposed(by: disposeBag)
        
        searchController.searchBar.rx
            .text
            .orEmpty
            .filter({ $0 != "" })
            .distinctUntilChanged()
            .debounce(.milliseconds(500), scheduler: MainScheduler.asyncInstance)
            .bind(to: onSearchTrigger)
            .disposed(by: disposeBag)
    }
}

extension BusinessSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        businesses.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BusinessTableViewCell.reuseIdentifier) as? BusinessTableViewCell
        else { fatalError("Can not find BusinessTableViewCell")}
        cell.setData(businesses.value[indexPath.row])
        return cell
    }
    
    
}
