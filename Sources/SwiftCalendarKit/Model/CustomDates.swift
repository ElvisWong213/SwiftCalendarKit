//
//  CustomDates.swift
//
//
//  Created by Elvis on 30/11/2023.
//

import Foundation

struct CustomDates: Identifiable {
    let id = UUID()
    let yearAndMonth: CustomYearMonth
    var days: [CustomDay] {
        get {
            getDays()
        }
    }
    
    private func getDays() -> [CustomDay] {
        let targetYearAndMonth = DateComponents(year: yearAndMonth.year, month: yearAndMonth.month, day: 1)
        let date = Calendar.current.date(from: targetYearAndMonth)!
        let range = Calendar.current.range(of: .day, in: .month, for: date)!
        let weekday = Calendar.current.component(.weekday, from: date) - 1
        var array: [CustomDay] = []
        for _ in 0..<weekday {
            array.append(CustomDay(text: ""))
        }
        for day in range {
            array.append(CustomDay(text: String(day)))
        }
        return array
    }
}
