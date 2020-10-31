import SwiftUI

struct StarView: View {
    @State var selectedIndex = -1
    var starCount = 5
    var body: some View {
        HStack {
            ForEach(0..<starCount){i in
                Image((i <= selectedIndex) ? "filled" : "unfilled",bundle: Bundle.module).onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    self.selectedIndex = i
                })
            }
        }
    }
}

struct SwiftUIStar_Previews: PreviewProvider {
    static var previews: some View {
        StarView()
    }
}
