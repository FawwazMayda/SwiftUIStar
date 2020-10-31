import SwiftUI

struct StarView: View {
    var starCount = 5
    var body: some View {
        HStack {
            ForEach(0..<starCount){i in
                Image("unfilled", bundle: Bundle.module)
            }
        }
    }
}

struct SwiftUIStar_Previews: PreviewProvider {
    static var previews: some View {
        StarView()
    }
}
