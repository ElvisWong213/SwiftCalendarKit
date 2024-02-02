//
//  MonthView.swift
//
//
//  Created by Elvis on 28/11/2023.
//

import SwiftUI

struct MonthView: View {
    @EnvironmentObject var swiftCalendarViewModel: SwiftCalendarViewModel
    let dates: CustomDates
    @Binding var selectedDate: Date
    let color: Color
    
    var body: some View {
        GeometryReader { geo in
            LazyVGrid(columns: swiftCalendarViewModel.columns, spacing: 0) {
                ForEach(dates.days) { day in
                    Button {
                        let targetYearAndMonth = DateComponents(year: dates.yearAndMonth.year, month: dates.yearAndMonth.month, day: Int(day.text))
                        selectedDate = Calendar.current.date(from: targetYearAndMonth)!
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(color)
                                .opacity(String(selectedDate.getDay()) == day.text ? 1 : 0)
                            Text(day.text)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    MonthView(dates: CustomDates(yearAndMonth: CustomYearMonth(year: 2023, month: 11)), selectedDate: .constant(Date()), color: .blue)
        .environmentObject(SwiftCalendarViewModel())
}
