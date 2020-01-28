
# RxDataSourcesViewModels

RxDataSourcesViewModels is a lightweight library that allows you to easily use your ViewModels with RxDataSources. 

You don’t need to do all the DataSource boilerplate to configure your cells for each TableView of your project anymore. 

1- Implement CellViewModelType protocol in your ViewModel:
```swift
import RxDataSourcesViewModels

class MyCellViewModel: CellViewModelType {

    // Return the cell identifier here. 
    var cellIdentifier: String {
        return "MyCellViewModelIdentifier"
    }
}
```

2- Implement CellViewModelConfigurable protocol in your Cells:

```swift
import RxDataSourcesViewModels

class MyCell: UITableViewCell, CellViewModelConfigurable {

    func configure(with viewModel: CellViewModelType) {
        
        // Cast to your specific ViewModel type.
        guard let viewModel = viewModel as? MyCellViewModel else { return }
        
        // Configure your cell with its ViewModel here...
    }
}
```
3- Bind your Driver of Sections to your TableView or CollectionView: 

```swift
import UIKit
import RxSwift
import RxDataSourcesViewModels

class MyViewController: UIViewController {

    let viewModel = MyViewModel()
    let dataSource = ViewModelsDataSource<String>()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    func bind() {
        viewModel.sections
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}
```
## Example
To see a full example of RxDataSourcesViewModels implementation, clone the repo, and run `pod install` from the Example directory.
## Requirements
- Swift 5.0
## Installation
RxDataSourcesViewModels is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:
```ruby

pod 'RxDataSourcesViewModels'

```
## Author
smatado, sgmatado@gmail.com
## License
RxDataSourcesViewModels is available under the MIT license. See the LICENSE file for more info.
