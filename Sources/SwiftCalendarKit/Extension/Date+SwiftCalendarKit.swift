//
//  Date+SwiftCalendarKit.swift
//
//
//  Created by Elvis on 30/11/2023.
//

import Foundation

extension Date {
    func getDay() -> Int {
        return Calendar.current.component(.day, from: self)
    }
    func getMonth() -> Int {
        return Calendar.current.component(.month, from: self)
    }
    func getYear() -> Int {
        return Calendar.current.component(.year, from: self)
    }
    
    mutating func updateDate(year: Int?, month: Int?, day: Int? = nil) {
        let year = year ?? self.getYear()
        let month = month ?? self.getMonth()
        let day = day ?? self.getDay()
        let target = DateComponents(year: year, month: month, day: day)
        self = Calendar.current.date(from: target)!
    }
}
