import SwiftUI

public struct SwiftCalendar: View {
    @StateObject var viewModel = SwiftCalendarViewModel()
    @Binding var selectedDate: Date
    
    private var textColor: Color = .primary
    private var selectedDateColor: Color = .blue
    
    public init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
        self.textColor = .primary
        self.selectedDateColor = .blue
    }
    
    public var body: some View {
        VStack {
            Button {
                viewModel.selectedYearAndMonth = CustomYearMonth(year: Date().getYear(), month: Date().getMonth())
                selectedDate = Date()
            } label: {
                Text(verbatim: "\(selectedDate.getDay())/\(selectedDate.getMonth())/\(selectedDate.getYear())")
                    .padding()
                    .bold()
            }
            LazyVGrid(columns: viewModel.columns) {
                ForEach(viewModel.weekdays, id: \.self) { weekday in
                    Text(weekday)
                }
            }
            .padding(.horizontal)
            TabView(selection: $viewModel.selectedYearAndMonth) {
                ForEach(viewModel.list) { dates in
                    MonthView(dates: dates, selectedDate: $selectedDate, color: selectedDateColor)
                        .environmentObject(viewModel)
                        .tag(dates.yearAndMonth)
                }
            }
            .onChange(of: viewModel.selectedYearAndMonth) { newValue in
                viewModel.updateList()
                selectedDate.updateDate(year: newValue.year, month: newValue.month)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .foregroundColor(textColor)
    }
}

extension SwiftCalendar {
    public func textColor(_ color: Color) -> SwiftCalendar {
        var updatedView = self
        updatedView.textColor = color
        return updatedView
    }
    
    public func selectedDateColor(_ color: Color) -> SwiftCalendar {
        var updatedView = self
        updatedView.selectedDateColor = color
        return updatedView
    }
}
