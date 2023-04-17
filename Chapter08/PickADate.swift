

import Foundation
import SwiftUI

struct PickADateView: View {
    @State var myDate = Date.now
    var body: some View {
        VStack {
            VStack {
                Text("Date and time:")
                DatePicker(selection: $myDate, label: { Text("Date") })
                    .datePickerStyle(.graphical)
            }
            VStack {
                Spacer()
                Text("Date only:")
                DatePicker(selection: $myDate, displayedComponents: [.date], label: { Text("Date") })
            }
            VStack {
                Spacer()
                Text("Time only:")
                DatePicker(selection: $myDate, displayedComponents: [.hourAndMinute], label: { Text("Time") })
            }
        }
    }
}

struct PickADateView_Previews: PreviewProvider {
    static var previews: some View {
        PickADateView()
    }
}


let dateRange: ClosedRange<Date> = {
    let calendar = Calendar.current
    let startComponents = DateComponents(year: 2022, month: 1, day: 1)
    let endComponents = DateComponents(year: 2022, month: 12, day: 31, hour: 23, minute: 59, second: 59)
    return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
}()
