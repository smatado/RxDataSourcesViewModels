//
//  AuthorsViewController.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSourcesViewModels

class AuthorsViewController: UIViewController {

    // MARK: - Public properties

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    // MARK: - Private properties
    
    private let viewModel = AuthorsViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupToolBar()
        setupTableView()
        setupBindings()
    }
    
    // MARK: - Public functions

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }

    // MARK: - Private functions
    
    private func setupToolBar() {
        toolBar.items?.append(editButtonItem)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: AuthorCell.nibName, bundle: nil),
                           forCellReuseIdentifier: AuthorCell.cellIdentifier)
        tableView.register(UINib(nibName: BookCell.nibName, bundle: nil),
                           forCellReuseIdentifier: BookCell.cellIdentifier)
        tableView.estimatedRowHeight = 44.0
//    public var identity: IdentityType
    }

    private func setupBindings() {
        
        let input = AuthorsViewModel.Input(itemDeleted: tableView.rx.itemDeleted,
                                           itemMoved: tableView.rx.itemMoved)
        
        let output = viewModel.transform(input)
        let dataSource = ViewModelsDataSource<String>()
        
        output.sections
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}
