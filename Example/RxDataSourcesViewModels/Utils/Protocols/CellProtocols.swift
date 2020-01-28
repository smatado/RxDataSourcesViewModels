//
//  Protocols.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

protocol NibInstantiable {
    static var nibName: String { get }
}

protocol CellRegistrable {
    static var cellIdentifier: String { get }
}
