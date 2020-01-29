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

import Foundation

/// Protocol that must be implemented by your cell's ViewModel to be handled by the ViewModelsDataSource.
public protocol CellViewModelType {
    
    /// The cell identifier of the cell associated to the ViewModel.
    var cellIdentifier: String { get }
}

/// Protocol that must be implemented by your cell to be configured by  your ViewModel.
public protocol CellViewModelConfigurable {
    
    /**
    Configures a cell with its ViewModel.
    
    - parameter viewModel: ViewModel used to configure the cell. Must be casted to the specific type.
    */
    func configure(with viewModel: CellViewModelType)
}

/// Optional: Protocol that could be implemented by your ViewModel to transform the data to DataSource items and sections.
public protocol DataSourceViewModelType {
    
    associatedtype ModelType
    associatedtype IdentityType: Hashable

    /**
    Transforms an array of models to an array of `ViewModelItem`. A default function is already implemented
     if you just want to map your array of models as is.
    
    - parameter models: Models to transform.
    - Returns: An array of `ViewModelItem` representing your models.
    */
    func viewModelItems(fromModels models: [ModelType]) -> [ViewModelItem<IdentityType>]
    
    /**
    Transforms a model to a `ViewModelItem`. You must create a ViewModel inside this function from the model provided.
    
    - parameter model: Model to transform.
    - Returns: A `ViewModelItem` representing your model.
    */
    func viewModelItem(fromModel model: ModelType) -> ViewModelItem<IdentityType>
    
    /**
    Creates a section from an array of `ViewModelItem`.  You must provide a unique identifier for each Section.
    
    - parameter viewModels: An array of `ViewModelItems`.
    - Returns: A `ViewModelItemsSection`.
    */
    func section(fromViewModelItems viewModelsItems: [ViewModelItem<IdentityType>]) -> ViewModelItemsSection<IdentityType>
}

public extension DataSourceViewModelType {
    
    func viewModelItems(fromModels models: [ModelType]) -> [ViewModelItem<IdentityType>] {
        return models.map { viewModelItem(fromModel: $0) }
    }
}
