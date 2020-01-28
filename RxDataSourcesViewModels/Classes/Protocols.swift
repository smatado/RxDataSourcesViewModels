//
//  Protocols.swift
//  RxDataSources+ViewModels
//
//  Created by Silbino Gonçalves Matado on 2020-01-12.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

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
