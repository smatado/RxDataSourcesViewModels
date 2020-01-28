//
//  Author.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import Foundation

struct Author {
    
    let authorId: String
    let name: String
    let birthDate: Date
    
    var identity: String {
        return "\(String(describing: Author.self)):\(authorId)"
    }
}
