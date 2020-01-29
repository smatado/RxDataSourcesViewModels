//
//  AuthorsViewModel.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSourcesViewModels

class AuthorsViewModel {
    
    // MARK: - Private properties
    
    private let store = AuthorsStore()
    private let disposeBag = DisposeBag()

    // MARK: - Private functions
    
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

// MARK: - ViewModelType

extension AuthorsViewModel: ViewModelType {
    
    struct Input {
        let itemDeleted: ControlEvent<IndexPath>
        let itemMoved: ControlEvent<ItemMovedEvent>
    }
    
    struct Output {
        let sections: Driver<[ViewModelItemsSection<String>]>
    }

    func transform(_ input: Input) -> Output {
        
        let authorsSection = store.authors
            .map(viewModelItems)
            .map(section)
        
        handleDelete(input.itemDeleted, authorsSection: authorsSection)
        handleMove(input.itemMoved)

        return Output(sections: sectionsDriver(from: authorsSection))
    }
}

// MARK: - DataSourceViewModelType

extension AuthorsViewModel: DataSourceViewModelType {
    
    typealias ModelType = Author
    typealias IdentityType = String
    
    func viewModelItem(fromModel model: Author) -> ViewModelItem<String> {
        ViewModelItem(viewModel: AuthorCellViewModel.init(author: model),
                      identity: model.identity,
                      canBeEdited: true,
                      canBeMoved: true)
    }

    func section(fromViewModelItems viewModelItems: [ViewModelItem<String>]) -> ViewModelItemsSection<String> {
        return ViewModelItemsSection(viewModels: viewModelItems, identity: "AuthorSection")
    }
}
