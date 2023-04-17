//
//  Intro.swift
//  Chapter08
//
//  Created by Mike Panitz on 4/16/23.
//

import Foundation
import SwiftUI

struct PickerIntroView: View {
    @State var choice = 1
    var body: some View {
        VStack {
            Spacer()
            Picker(selection: $choice, label: Text("Picker")) {
                Text("Bird").tag(1)
                Text("Cat").tag(2)
                Text("Lizard").tag(3)
                Text("Dog").tag(4)
                Text("Hamster").tag(5)
            }
            Spacer()
            Text("You chose \(choice)")
            Spacer()
        }
    }
}

struct PickerIntroView_Previews: PreviewProvider {
    static var previews: some View {
        PickerIntroView()
    }
}



