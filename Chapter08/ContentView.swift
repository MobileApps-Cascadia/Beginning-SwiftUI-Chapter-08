//
//  ContentView.swift
//  Chapter08
//
//  Created by Mike Panitz on 4/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PickerIntroView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Basic Pickers")
                }
            PickAColorView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Color Picker")
                }
            PickADateView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Date Picker")
                }
            PickARestrictedDateView()
                .tabItem {
                    Image(systemName: "4.circle")
                    Text("Restricted Date Picker")
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


