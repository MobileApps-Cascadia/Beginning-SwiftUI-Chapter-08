

import Foundation
import SwiftUI

struct PickARestrictedDateView: View {
    @State var myDate = Date.now
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2022, month: 1, day: 1)
        let endComponents = DateComponents(year: 2022, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    let dateRange2: PartialRangeFrom<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2023, month: 4, day: 10)
        return calendar.date(from:startComponents)!...
    }()

    let dateRange3: PartialRangeThrough<Date> = {
        let calendar = Calendar.current
        let stopComponents = DateComponents(year: 2023, month: 6, day: 9)
        return ...calendar.date(from:stopComponents)!
    }()
    
    let formatter = {
        let fmt = DateFormatter()
        fmt.dateStyle = .full
        fmt.timeStyle = .full
        return fmt
    }()
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text("Between Jan 1 2022 and Dec 31 2023:")
                DatePicker(selection: $myDate, in: dateRange ,label: { Text("Date") })
                    .datePickerStyle(.compact)
                Text("You picked:\n\(formatter.string( from: myDate))")
            }
            VStack {
                Spacer()
                Text("Apr 10 2023 or later:")
                DatePicker(selection: $myDate, in:dateRange2, displayedComponents: [.date],  label: { Text("Date") })
            }
            VStack {
                Spacer()
                Text("Jun 9 2023 or Earlier:")
                DatePicker(selection: $myDate, in:dateRange3, displayedComponents: [.date], label: { Text("Time") })
            }
            Spacer()
        }
    }
}

struct PickARestrictedDateView_Previews: PreviewProvider {
    static var previews: some View {
        PickARestrictedDateView()
    }
}
