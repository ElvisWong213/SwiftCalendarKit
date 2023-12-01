//
//  TestSwiftCalendar.swift
//
//
//  Created by Elvis on 01/12/2023.
//

import SwiftUI

private struct TestSwiftCalendar: View {
    @State var selectedDate = Date()
    var body: some View {
        SwiftCalendar(selectedDate: $selectedDate)
            .textColor(.red)
            .selectedDateColor(.green)
    }
}

#Preview {
    TestSwiftCalendar()
}
