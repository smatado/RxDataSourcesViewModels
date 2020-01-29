Pod::Spec.new do |s|
    
  s.name             = 'RxDataSourcesViewModels'
  s.version          = '0.2.0'
  s.summary          = 'Easily configure yours cells with ViewModels and RxSwift in a declarative way without the DataSources boilerplate.'

  s.description      = "RxDataSourcesViewModels is a lightweight library that allows you to easily use your ViewModels with RxDataSources. You don’t need to do all the boilerplate to configure your cells for each TableView of your project. First  implement 2 protocols in your Cells and cell’s ViewModels. Then just create a ViewModel to transform your data models to cell’s ViewModels with the magic of RxSwift in a more declarative way."

  s.homepage         = 'https://github.com/smatado/RxDataSourcesViewModels'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'smatado' => 'sgmatado@gmail.com' }
  s.source           = { :git => 'https://github.com/smatado/RxDataSourcesViewModels.git', :tag => s.version.to_s }

  s.swift_versions = '5.0'
  s.ios.deployment_target = '11.0'
  s.source_files = 'RxDataSourcesViewModels/Classes/**/*'
  
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'RxDataSources'
  
end
