//
//  ViewModelType.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-07.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

protocol ViewModelType {
    
    associatedtype Input
    associatedtype Output

    func transform(_ input: Input) -> Output
}
