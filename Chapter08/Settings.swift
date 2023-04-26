//
//  Settings.swift
//  Chapter08
//
//  Created by Student Account on 4/25/23.
//

import SwiftUI

struct Settings: View {
    @State var appMode = "Free"
    @State private var accentColor = Color.blue
    
    @State var myDate = Date.now
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2023, month: 3, day: 27)
        let endComponents = DateComponents(year: 2023, month: 6, day: 9)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    let formatter = {
        let fmt = DateFormatter()
        fmt.dateStyle = .full
        return fmt
    }()
    
    var body: some View {
        VStack{
            Spacer()
            Text("App Mode: ")
            Picker(selection: $appMode, label: Text("AppMode")) {
                Text("Free").tag("Free")
                Text("Trial").tag("Trial")
                Text("Professional").tag("Professional")
            }
            Spacer()
            ColorPicker("Accent Color", selection: $accentColor, supportsOpacity: false)
                            .padding()
                            .onChange(of: accentColor) { color in
                                // Set the new accent color in the environment
                               UIApplication.shared.windows.first?.rootViewController?.view.tintColor = UIColor(color)
                            }
            .frame(width: 160)
            .background(accentColor.colorInvert())
            
            Spacer()
            Text("Choose date within the current quarter:")
            DatePicker(selection: $myDate, in: dateRange , displayedComponents: [.date], label: { Text("Date") })
                .datePickerStyle(.compact)
            
                .frame(width: 180)
            Text("You picked:\n\(formatter.string( from: myDate))")
            Spacer()
        }
        .accentColor(accentColor)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
