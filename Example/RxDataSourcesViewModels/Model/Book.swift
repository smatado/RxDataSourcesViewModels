//
//  Book.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import Foundation

struct Book {
    
    let bookId: String
    let title: String
    let genre: String
    let releaseDate: Date
    
    var identity: String {
        return "\(String(describing: Book.self)):\(bookId)"
    }
    
}
