//
//  DateFormatter+Extensions.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-11.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let yyyyMMdd: DateFormatter = {
        let date = DateFormatter()
        date.dateFormat = "YYYY-MM-dd"
        return date
    }()

    static let mmYYYY: DateFormatter = {
        let date = DateFormatter()
        date.dateFormat = "MM-YYYY"
        return date
    }()
}
