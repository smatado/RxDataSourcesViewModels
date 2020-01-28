//
//  MainService.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import RxSwift

class AuthorsStore {
    
    let authorsSubject: BehaviorSubject<[Author]>
    let authors: Observable<[Author]>

    init() {
        authorsSubject = .init(value: initialAuthors)
        authors = authorsSubject.asObservable()
    }
    
    func move(sourceIndex: Int, destinationIndex: Int) {
        guard var authors = try? self.authorsSubject.value() else { return }
        let author = authors[sourceIndex]
        authors.remove(at: sourceIndex)
        authors.insert(author, at: destinationIndex)
        authorsSubject.onNext(authors)
    }
    
    func delete(identity: String) {
        guard var authors = try? self.authorsSubject.value() else { return }
        authors.removeAll(where: { $0.identity == identity })
        authorsSubject.onNext(authors)
    }
}

let initialAuthors: [Author] = [
    Author(authorId: "8765",
           name: "Victor Hugo",
           birthDate: DateFormatter.yyyyMMdd.date(from: "1802-02-26")!),
    Author(authorId: "87",
           name: "Marcel Proust",
           birthDate: DateFormatter.yyyyMMdd.date(from: "1871-07-10")!),
    Author(authorId: "234",
           name: "Alexandre Dumas",
           birthDate: DateFormatter.yyyyMMdd.date(from: "1802-07-24")!),
    Author(authorId: "9",
           name: "Honoré de Balzac",
           birthDate: DateFormatter.yyyyMMdd.date(from: "1799-05-20")!),
    Author(authorId: "76543",
           name: "Jean-Jacques Rousseau",
           birthDate: DateFormatter.yyyyMMdd.date(from: "1712-06-28")!),
    Author(authorId: "234567",
           name: "Gustave Flaubert",
           birthDate: DateFormatter.yyyyMMdd.date(from: "1821-12-18")!),
    Author(authorId: "4",
           name: "Charles Baudelaire",
           birthDate: DateFormatter.yyyyMMdd.date(from: "1821-04-9")!),
    Author(authorId: "8",
           name: "Jules Verne",
           birthDate: DateFormatter.yyyyMMdd.date(from: "1828-02-8")!),
    Author(authorId: "4567",
           name: "Émile Zola",
           birthDate: DateFormatter.yyyyMMdd.date(from: "1840-09-29")!)
]
