

import Foundation
import SwiftUI

struct PickAColorView: View {
    @State var myColor = Color.gray
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 200, height: 150)
                .foregroundColor(myColor)
            ColorPicker("Pick a color", selection: $myColor)
        }
    }
}

struct PickAColorView_Previews: PreviewProvider {
    static var previews: some View {
        PickAColorView()
    }
}



