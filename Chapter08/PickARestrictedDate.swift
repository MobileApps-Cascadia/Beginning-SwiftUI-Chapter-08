

import Foundation
import SwiftUI

struct PickARestrictedDateView: View {
    @State var myDate = Date.now
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2022, month: 3, day: 1)
        let endComponents = DateComponents(year: 2022, month: 6, day: 30, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    

    let formatter = {
        let fmt = DateFormatter()
        fmt.dateStyle = .full
        fmt.timeStyle = .full
        return fmt
    }()
    @State var choice = "Freemode"
    @State var myColor = Color.red
    var body: some View {
        
        VStack {
            VStack {
                
                Text("Please choose the mode you would like to use")
                Picker(selection: $choice, label: Text("Picker")) {
                    Text("Free").tag("Free Mode")
                    Text("Trial").tag("Trial Mode")
                    Text("Professional").tag("Professional Mode")
                }
                
                Spacer()
                
                ColorPicker("The color makes this now", selection: $myColor, supportsOpacity: false)
                    .padding()
                    .onChange(of: myColor){
                        color in UIApplication.shared.windows.first?.rootViewController?.view.tintColor = UIColor(color)
                    }
                    .frame(width: 200)
                    .background(myColor.colorInvert())
                
                Spacer()
                
                Text("A date this quarter")
                DatePicker(selection: $myDate, in: dateRange ,label: { Text("Date") })
                    .datePickerStyle(.compact)
                Text("You picked:\n\(formatter.string( from: myDate))")
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
