import SwiftUI

struct StarView: View {
    @State var selectedIndex = -1
    var starCount = 5
    
    init(starCount: Int = 5) {
        self.starCount = starCount
    }
    
    var body: some View {
        HStack {
            ForEach(0..<starCount){i in
                Image((i <= selectedIndex) ? "filled" : "unfilled",bundle: Bundle.module).resizable().onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    if self.selectedIndex == i {
                        self.selectedIndex = -1
                    } else {
                        self.selectedIndex = i
                    }
                })
            }
        }.aspectRatio(contentMode: .fit)
    }
}

struct SwiftUIStar_Previews: PreviewProvider {
    static var previews: some View {
        StarView(starCount: 10)
    }
}
