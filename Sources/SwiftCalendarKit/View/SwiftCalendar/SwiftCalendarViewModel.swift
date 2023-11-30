//
//  SwiftCalendarViewModel.swift
//
//
//  Created by Elvis on 30/11/2023.
//

import Foundation
import SwiftUI

class SwiftCalendarViewModel: ObservableObject {
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    let weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    @Published var list: [CustomDates]
    @Published var selectedYearAndMonth: CustomYearMonth

    
    init() {
        self.list = []
        self.selectedYearAndMonth = CustomYearMonth(year: Date().getYear(), month: Date().getMonth())
        self.setup()
    }
    
    private func setup() {
        let currentYear = Date().getYear()
        let currentMonth = Date().getMonth()
        self.list.append(CustomDates(yearAndMonth: CustomYearMonth(year: currentYear, month: currentMonth - 1)))
        self.list.append(CustomDates(yearAndMonth: CustomYearMonth(year: currentYear, month: currentMonth)))
        self.list.append(CustomDates(yearAndMonth: CustomYearMonth(year: currentYear, month: currentMonth + 1)))
    }
    
    private func loadNextMonth() {
        DispatchQueue.main.async {
            var next = self.selectedYearAndMonth
            next.nextMonth()
            self.list.append(CustomDates(yearAndMonth: next))
        }
    }
    
    private func loadPreviousMonth() {
        DispatchQueue.main.async {
            var previous = self.selectedYearAndMonth
            previous.previousMonth()
            self.list.insert(CustomDates(yearAndMonth: previous), at: 0)
        }
    }
    
    func updateList() {
        DispatchQueue.global().async {
            guard let index = self.list.firstIndex(where: { $0.yearAndMonth == self.selectedYearAndMonth }) else {
                print("DEBUG - Unable to get index from the list")
                return
            }
            if index == 0 {
                self.loadPreviousMonth()
            }
            if index == self.list.count - 1 {
                self.loadNextMonth()
            }
        }
    }
}
