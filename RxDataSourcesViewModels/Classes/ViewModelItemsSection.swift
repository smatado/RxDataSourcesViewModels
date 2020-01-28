//
//  ViewModelItemsSection.swift
//  RxDataSources+ViewModels
//
//  Created by Silbino Gonçalves Matado on 2020-01-07.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import RxDataSources

/**
    
 The Sections used by the `ViewModelsDataSource`. Your `TableView` must be drived by a`Driver` of
 array of `ViewModelItemsSection`. 
 
 `IdentityType` type (typically a `String`) used as unique identifier for each cell to automatically manage animations. This must be the same type used by your `ViewModelsDataSource` and `ViewModelItems`.

 */
public struct ViewModelItemsSection<IdentityType: Hashable>: AnimatableSectionModelType {
    
    public typealias Item = ViewModelItem<IdentityType>
    public typealias Identity = IdentityType

    public var items: [Item]
    public var identity: IdentityType
    public var headerTitle: String?
    public var footerTitle: String?

    /// Initialize a `ViewModelItemsSection`with its items, identity, header and footer titles.
    ///
    /// - parameter viewModels: Array of ViewModels for the section.
    /// - parameter identity: Unique identifier for the section.
    /// - parameter headerTitle: Optional: header title.
    /// - parameter footerTitle: Optional: footer title.

    public init(viewModels: [Item], identity: IdentityType, headerTitle: String? = nil, footerTitle: String? = nil) {
        self.identity = identity
        self.items = viewModels
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
    }
    
    public init(original: ViewModelItemsSection, items: [Item]) {
        self = original
        self.items = items
    }
}
