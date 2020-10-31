import SwiftUI

struct StarView: View {
    var body: some View {
        VStack {
            Text("Filled Star")
            Image("filled",bundle: Bundle.module)
            Text("Unfilled Star")
            Image("unfilled", bundle: Bundle.module)
        }
    }
}

struct SwiftUIStar_Previews: PreviewProvider {
    static var previews: some View {
        StarView()
    }
}
