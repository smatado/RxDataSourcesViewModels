//
//  ViewModelsDataSource.swift
//  RxDataSources+ViewModels
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import RxDataSources

/**
 
 The DataSource used as parameter to the `tableView.rx.items(dataSource:)` function.
 `ViewModelsDataSource` configures your cells with the ViewModel you provided to the `ViewModelItem`.
 
 `IdentityType` type (typically a `String`)  used as unique identifier for each cell to automatically manage animations. This must be the same type used by your `ViewModelsItemsSections` and `ViewModelItems`.
 
 */
public class ViewModelsDataSource<IdentityType: Hashable>: RxTableViewSectionedAnimatedDataSource<ViewModelItemsSection<IdentityType>> {
    
    public init() {
        super.init(configureCell: { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: item.viewModel.cellIdentifier, for: indexPath)
            if let configurableCell = cell as? CellViewModelConfigurable {
                configurableCell.configure(with: item.viewModel)
            }
            return cell
        }, titleForHeaderInSection: { dataSource, index in
            return dataSource.sectionModels[index].headerTitle
        }, titleForFooterInSection: { dataSource, index in
            return dataSource.sectionModels[index].footerTitle
        }, canEditRowAtIndexPath: { dataSource, indexPath in
            return dataSource.sectionModels[indexPath.section].items[indexPath.row].canBeEdited
        }, canMoveRowAtIndexPath: { dataSource, indexPath in
            return dataSource.sectionModels[indexPath.section].items[indexPath.row].canBeMoved
        })
    }
}
