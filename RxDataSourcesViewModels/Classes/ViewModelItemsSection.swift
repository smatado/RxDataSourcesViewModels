/*
    Copyright (c) 2020 smatado <sgmatado@gmail.com>

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
*/

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
