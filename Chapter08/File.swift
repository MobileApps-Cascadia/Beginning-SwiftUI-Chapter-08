//
//  File.swift
//  Chapter08
//
//  Created by Eddington, Nick on 4/25/23.
//

import SwiftUI
// Add a screen that allows the user to pick between one of several, set options, that also allows the user to pick a color, and also allows the user to pick a date.
struct LunchOptionsView: View {
    
    let options = ["Sandwich", "Salad", "Candy"]
    
    @State private var selectedOption = ""
    @State private var selectedColor = Color.white
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            Text("What would you like for lunch?")
                .font(.title)
                .padding()
            
            Picker("Lunch Options", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            ColorPicker("Pick a color", selection: $selectedColor)
                .padding()
            
            DatePicker("Pick a date", selection: $selectedDate, displayedComponents: [.date])
                .padding()
            
            Spacer()
            
            Text("Your choice:")
                .font(.headline)
                .padding()
            
            Text("Lunch: \(selectedOption)")
                .padding()
            
            Text("Color: \(selectedColor.description)")
                .padding()
            
            Text("Date: \(selectedDate, formatter: dateFormatter)")
                .padding()
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}
// Extension to get the complementary color of a given color
extension Color {
    func uiColor() -> UIColor {
        guard let components = self.cgColor?.components else { fatalError("Unexpected color format") }
        return UIColor(red: components[0], green: components[1], blue: components[2], alpha: components[3])
    }

    func complementary() -> Color {
        let uiColor = self.uiColor()
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        guard uiColor.getHue(&h, saturation: &s, brightness: &b, alpha: &a) else { return .black }
        return Color(UIColor(hue: (h + 0.5).truncatingRemainder(dividingBy: 1), saturation: s, brightness: b, alpha: a))
    }

    static func complementary(of color: Color) -> Color {
        return color.complementary()
    }
}


// Create a new screen that's clearly labeled as the Settings screen for the app
// Settings screen should allow the user to choose to use the app in one of three modes: Free mode, Trial mode, and Professional mode
// Allow the user to choose what the primary color for the user interface should be.
// In addition to showing the chosen color your app should also show the complementary color, using a Complementary Colours Algorithm
// Allow the user to choose a date within the current quarter.
struct SettingsView: View {
    
    @State private var selectedMode = "Free"
    @State private var selectedColor = Color.white
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .padding()
            
            Picker("Mode", selection: $selectedMode) {
                Text("Free").tag("Free")
                Text("Trial").tag("Trial")
                Text("Professional").tag("Professional")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ColorPicker("Primary color", selection: $selectedColor)
                .padding()
            
            HStack {
                Text("Complementary color:")
                    .padding(.trailing, 10)
                Rectangle()
                    .fill(Color.complementary(of: selectedColor))
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
            }
            .padding()
            
            DatePicker("Pick a date", selection: $selectedDate, in: Date()...Date().addingTimeInterval(60*60*24*90), displayedComponents: [.date])
                .padding()
            
            Spacer()
        }
    }
}

// TabView to present both LunchOptionsView and SettingsView
struct FileView: View {
    
    var body: some View {
        TabView {
            LunchOptionsView()
                .tabItem {
                    Label("Lunch", systemImage: "bag")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct FileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FileView()
                .preferredColorScheme(.light)
            
            FileView()
                .preferredColorScheme(.dark)
        }
    }
}

   

