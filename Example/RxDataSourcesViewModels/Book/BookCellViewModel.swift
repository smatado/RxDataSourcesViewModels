//
//  BookCellViewModel.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import RxDataSources
import RxDataSourcesViewModels

struct BookCellViewModel: CellViewModelType {
    
    let title: String
    let genre: String
    let releaseDate: String

    //MARK: - CellViewModelType

    var cellIdentifier: String {
        return BookCell.cellIdentifier
    }
    
    //MARK: - Init

    init(book: Book) {
        title = book.title
        genre = book.genre
        releaseDate = DateFormatter.mmYYYY.string(from: book.releaseDate)
    }
}
