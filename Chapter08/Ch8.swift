//
//  Intro.swift
//  Chapter08
//
//  Created by Mike Panitz on 4/16/23.
//

import Foundation
import SwiftUI

struct chap8: View {
    @State var choice = ""
    @State var myColor = Color.red
    @State var myDate = Date.now
    var body: some View {
        VStack {
            Spacer()
            Text("What role in lol do you play?")
            Picker(selection: $choice, label: Text("Picker")) {
                Text("TOP").tag("Top")
                Text("JG").tag("Jungle")
                Text("MID").tag("Middle")
                Text("ADC").tag("Attack Damage Carry")
                Text("SUP").tag("Support")
            }
            Text("You chose \(choice)")
            Spacer()
                Rectangle()
                    .frame(width: 100, height: 50)
                    .foregroundColor(myColor)
                ColorPicker("What color emotion do you feel playing the game?", selection: $myColor)
            Spacer()
            Text("When did you last play this game?")
            DatePicker(selection: $myDate, label: { Text("Date") })
                .datePickerStyle(.graphical)
        }
        
        
    }
}

struct chap8_Previews: PreviewProvider {
    static var previews: some View {
        PickerIntroView()
    }
}
