//
//  AuthorCellViewModel.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import RxDataSources
import RxDataSourcesViewModels

struct AuthorCellViewModel: CellViewModelType {
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    let name: String
    let birthDate: String
    
    //MARK: - CellViewModelType

    var cellIdentifier: String {
        return AuthorCell.cellIdentifier
    }
    
    //MARK: - Init

    init(author: Author) {
        name = author.name
        birthDate = dateFormatter.string(from: author.birthDate)
    }
}
