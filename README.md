#  SwiftCalendarKit
[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/ElvisWong)

## About This Project
Calendar View build with SwiftUI

## Preview

https://github.com/ElvisWong213/SwiftCalendarKit/assets/40566101/d56a0c44-bd81-4c0f-9097-1876c50e5f62

## Requirements
- iOS 16+
- Swift 5.0+

## Installation

### Swift Package Manager
- File > Swift Packages > Add Package Dependency
- Add `https://github.com/ElvisWong213/SwiftCalendarKit`
- Select "Up to Next Major" with "1.0.0"

## Usage

### Implement 
``` swift
import SwiftCalendarKit

@State var selectedDate = Date()
SwiftCalendar(selectedDate: $selectedDate)
```

### Modifiers 

```swift
.textColor(Color.red)
.selectedDateColor(Color.green)
```
