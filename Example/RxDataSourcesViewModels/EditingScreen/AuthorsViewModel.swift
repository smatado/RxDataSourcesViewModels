//
//  AuthorsViewModel.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources
import RxDataSourcesViewModels

class AuthorsViewModel: ViewModelType {
    
    struct Input {
        let itemDeleted: ControlEvent<IndexPath>
        let itemMoved: ControlEvent<ItemMovedEvent>
    }
    
    struct Output {
        let sections: Driver<[ViewModelItemsSection<String>]>
    }

    // MARK: - Private properties
    
    private let store = AuthorsStore()
    private let disposeBag = DisposeBag()

    // MARK: - Public functions

    func transform(_ input: Input) -> Output {
        
        let authorsSection = store.authors
            .map(viewModelItems)
            .map(section)
        
        handleDelete(input.itemDeleted, authorsSection: authorsSection)
        handleMove(input.itemMoved)

        return Output(sections: sectionsDriver(from: authorsSection))
    }
    
    private func viewModelItems(from authors: [Author]) -> [ViewModelItem<String>] {
        return authors.map(viewModelItem)
    }
    
    private func viewModelItem(from author: Author) -> ViewModelItem<String> {
        let viewModel = AuthorCellViewModel.init(author: author)
        return ViewModelItem(viewModel: viewModel,cellIdentifier: viewModel.cellIdentifier,
                             identity: author.identity,canBeEdited: true, canBeMoved: true)
    }
    
    private func section(from viewModels: [ViewModelItem<String>]) -> ViewModelItemsSection<String> {
        return ViewModelItemsSection(viewModels: viewModels, identity: "AuthorSection")
    }
    
    private func handleDelete(_ itemDeleted: ControlEvent<IndexPath>,
                              authorsSection: Observable<ViewModelItemsSection<String>>) {
        itemDeleted
            .withLatestFrom(authorsSection, resultSelector: { indexPath, authorSection in
                authorSection.items[indexPath.row].identity
            })
            .subscribe(onNext: { [unowned self] authorIdentity in
                self.store.delete(identity: authorIdentity)
            })
            .disposed(by: disposeBag)
    }
    
    private func handleMove(_ itemMoved: ControlEvent<ItemMovedEvent>) {
        itemMoved
            .subscribe(onNext: { [unowned self] (sourceIndexPath, destinationIndexPath) in
                self.store.move(sourceIndex: sourceIndexPath.row,
                                destinationIndex: destinationIndexPath.row)
            })
            .disposed(by: disposeBag)
    }
    
    private func sectionsDriver(from authorsSection: Observable<ViewModelItemsSection<String>>) -> Driver<[ViewModelItemsSection<String>]> {
        return authorsSection.map { [$0] }
            .asDriver(onErrorJustReturn: [])
    }
}
