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
