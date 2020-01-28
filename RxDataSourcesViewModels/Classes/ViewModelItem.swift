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
