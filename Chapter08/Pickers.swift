//
//  Pickers.swift
//  Chapter08
//
//  Created by Student Account on 4/25/23.
//

import SwiftUI

struct Pickers: View {
    @State var choice = "nothing"
    @State var myColor = Color.gray
    @State var birthdate = Date.now
    var body: some View {
        VStack{
            Spacer()
            Text("What would you like for lunch?")
                Picker(selection: $choice, label: Text("Picker")) {
                    Text("Sandwich").tag("sandwich")
                    Text("Salad").tag("salad")
                    Text("Candy").tag("candy")
                    Text("Soup").tag("soup")
                    Text("Nothing").tag("nothing")
                }
                Text("You chose \(choice)")
                Spacer()
            
            Text("Choose a color")
                .foregroundColor(myColor)
                ColorPicker("Pick a color", selection: $myColor)
                .frame(width: 160)
            Spacer()
            
           DatePicker(selection: $birthdate, displayedComponents: [.date], label: { Text("When is your birthdate?") })
                .frame(width: 250)
            Spacer()
        }
    }
}

struct Pickers_Previews: PreviewProvider {
    static var previews: some View {
        Pickers()
    }
}
