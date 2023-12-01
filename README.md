#  SwiftCalendarKit
Calendar View build with SwiftUI

## Requirements
- iOS 16+
- Swift 5.0+

## Installation

### Swift Package Manager
- File > Swift Packages > Add Package Dependency
- Add `https://github.com/ElvisWong213/SwiftCalendarKit`
- Select "Up to Next Major" with "1.0.0"

## Usage
``` swift
import SwiftCalendarKit

@State var selectedDate = Date()
SwiftCalendar(selectedDate: $selectedDate)

```
