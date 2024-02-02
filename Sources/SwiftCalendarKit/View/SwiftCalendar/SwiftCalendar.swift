import SwiftUI

public struct SwiftCalendar: View {
    @StateObject var viewModel = SwiftCalendarViewModel()
    @Binding var selectedDate: Date
    
    // Text
    private var textColor: Color
    private var titleTextColor: Color
    private var weekdaysTextColor: Color
    
    // Selected Date
    private var selectedDateColor: Color
    
    // Background
    private var backgroundColor: Color
    
    public init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
        self.textColor = .primary
        self.titleTextColor = .primary
        self.weekdaysTextColor = .primary
        
        self.selectedDateColor = .blue
        
        self.backgroundColor = .clear
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
                    .foregroundStyle(titleTextColor)
            }
            LazyVGrid(columns: viewModel.columns) {
                ForEach(viewModel.weekdays, id: \.self) { weekday in
                    Text(weekday)
                }
            }
            .foregroundStyle(weekdaysTextColor)
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
        .foregroundStyle(textColor)
        .background(backgroundColor)
    }
}

extension SwiftCalendar {
    // Text
    public func textColor(_ color: Color) -> SwiftCalendar {
        var updatedView = self
        updatedView.textColor = color
        return updatedView
    }    
    
    public func titleTextColor(_ color: Color) -> SwiftCalendar {
        var updatedView = self
        updatedView.titleTextColor = color
        return updatedView
    }
    
    public func weekdaysTextColor(_ color: Color) -> SwiftCalendar {
        var updatedView = self
        updatedView.weekdaysTextColor = color
        return updatedView
    }
    
    // Selected Date
    public func selectedDateColor(_ color: Color) -> SwiftCalendar {
        var updatedView = self
        updatedView.selectedDateColor = color
        return updatedView
    }
    
    // Backgrund
    public func backgroundColor(_ color: Color) -> SwiftCalendar {
        var updatedView = self
        updatedView.backgroundColor = color
        return updatedView
    }
}

// MARK: - Preview
private struct SwiftCalendar_Previews: View {
    @State var selectedDate = Date()
    var body: some View {
        SwiftCalendar(selectedDate: $selectedDate)
            .titleTextColor(.red)
            .weekdaysTextColor(.blue)
            .textColor(.purple)
            .selectedDateColor(.green)
            .backgroundColor(.yellow)
    }
}

#Preview {
    SwiftCalendar_Previews()
}
