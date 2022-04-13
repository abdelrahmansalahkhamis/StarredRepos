//
//  Date+.swift
//  StarredRepos
//
//  Created by abdrahman on 13/04/2022.
//

import Foundation

extension Date {
    
    static func -(lhs: Date, rhs: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -rhs, to: lhs)!
    }
}
