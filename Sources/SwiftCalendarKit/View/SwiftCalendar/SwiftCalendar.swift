import SwiftUI

public struct SwiftCalendar: View {
    @StateObject var viewModel = SwiftCalendarViewModel()
    @State var selectedDate: Date = Date()
    
    public var body: some View {
        VStack {
            Button {
                viewModel.selectedYearAndMonth = CustomYearMonth(year: Date().getYear(), month: Date().getMonth())
            } label: {
                Text(verbatim: "\(selectedDate.getDay())/\(selectedDate.getMonth())/\(selectedDate.getYear())")
                    .padding()
            }
            LazyVGrid(columns: viewModel.columns) {
                ForEach(viewModel.weekdays, id: \.self) { weekday in
                    Text(weekday)
                }
            }
            .padding(.horizontal)
            TabView(selection: $viewModel.selectedYearAndMonth) {
                ForEach(viewModel.list) { dates in
                    MonthView(dates: dates, selectedDate: $selectedDate)
                        .environmentObject(viewModel)
                        .tag(dates.yearAndMonth)
                }
            }
            .onChange(of: viewModel.selectedYearAndMonth) { newValue in
                viewModel.updateList()
                selectedDate.updateDate(year: newValue.year, month: newValue.month)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct SwiftCalendar_Previews: PreviewProvider {
    static var previews: some View {
        SwiftCalendar()
    }
}


