//
//  CustomYearMonth.swift
//  
//
//  Created by Elvis on 30/11/2023.
//

import Foundation

struct CustomYearMonth: Comparable, Hashable {
    static func < (lhs: CustomYearMonth, rhs: CustomYearMonth) -> Bool {
        if lhs.year < rhs.year {
            return true
        } else if lhs.month < rhs.month {
            return true
        }
        return false
    }
    
    static func > (lhs: CustomYearMonth, rhs: CustomYearMonth) -> Bool {
        if lhs.year > rhs.year {
            return true
        } else if lhs.month > rhs.month {
            return true
        }
        return false
    }
    
    static func == (lhs: CustomYearMonth, rhs: CustomYearMonth) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month
    }
    
    private (set) var year: Int
    private (set) var month: Int
    
    mutating func nextMonth() {
        month += 1
        if month > 12 {
            month = 1
            year += 1
        }
    }
    
    mutating func previousMonth() {
        month -= 1
        if month < 1 {
            month = 12
            year -= 1
        }
    }
}
