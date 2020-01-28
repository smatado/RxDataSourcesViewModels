//
//  ViewModelItem.swift
//  RxDataSources+ViewModels
//
//  Created by Silbino Gonçalves Matado on 2020-01-12.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import RxDataSources

/**
   
 The Item used to construct a`ViewModelItemsSection`.

 `IdentityType` type (typically a `String`)  used as unique identifier for each cell to automatically manage animations. This must be the same type used by your `ViewModelsDataSource` and `ViewModelItemsSection`.

*/
public struct ViewModelItem<IdentityType: Hashable>: IdentifiableType, Equatable {
    
    public typealias Identity = IdentityType

    public var identity: IdentityType
    var viewModel: CellViewModelType
    var cellIdentifier: String
    var canBeEdited: Bool
    var canBeMoved: Bool

    /// Initialize a `ViewModelItemsSection`with its items, identity, header and footer titles.
    ///
    /// - parameter viewModel: ViewModel used to configure the cell.
    /// - parameter cellIdentifier: The cell identifier associated to the cell you want to configure.
    /// - parameter canBeEdited: Boolean indicating if the item can be edited.
    /// - parameter canBeMoved: Boolean indicating if the item can be moved.

    public init<ViewModel: CellViewModelType>(viewModel: ViewModel, cellIdentifier: String, identity: IdentityType, canBeEdited: Bool = false, canBeMoved: Bool = false) {
        self.viewModel = viewModel
        self.cellIdentifier = cellIdentifier
        self.identity = identity
        self.canBeEdited = canBeEdited
        self.canBeMoved = canBeMoved
    }

    /// Initializer required by RxDatasources.
    public static func == (lhs: ViewModelItem, rhs: ViewModelItem) -> Bool {
        return lhs.identity == rhs.identity
    }
}
