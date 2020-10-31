import SwiftUI

struct StarView: View {
    @ObservedObject var starViewModel: StarViewModel
    var starAmount: Binding<Int>
    var filledStar: String
    var unfilledStar: String
    var isEditing: Bool
    
    init(starCount: Int = 5,filledStar: String = "star_filled", unfilledStar: String = "star_unfilled", starAmount: Binding<Int>, isEditing: Bool = true) {
        self.filledStar = filledStar
        self.unfilledStar = unfilledStar
        self.starAmount = starAmount
        self.isEditing = isEditing
        self.starViewModel = StarViewModel(starCount: starCount)
        self.starViewModel.click(at: self.starAmount.wrappedValue - 1)
    }
    
    var body: some View {
            HStack {
                ForEach(0..<starViewModel.clickStar.count){i in
                    Image((starViewModel.clickStar[i]) ? filledStar : unfilledStar,bundle: Bundle.module).resizable().onTapGesture(perform: {
                        if self.isEditing {
                            self.starViewModel.click(at: i)
                            self.starAmount.wrappedValue = self.starViewModel.starCount
                        }
                    })
                }
            }.aspectRatio(contentMode: .fit)
    }
}

class StarViewModel: ObservableObject {
    @Published var clickStar: [Bool]
    var lastFilledIndex: Int {
        return clickStar.lastIndex(of: true) ?? -1
    }
    
    var starCount: Int {
        return lastFilledIndex + 1
    }
    
    init(starCount: Int) {
        self.clickStar = Array.init(repeating: false, count: starCount)
    }
    
    func click(at i : Int) {
        for j in 0..<clickStar.count {
            if i == lastFilledIndex {
                clickStar[j] = false
            } else {
                if j <= i {
                    clickStar[j] = true
                } else {
                    clickStar[j] = false
                }
            }
        }
    }
}

struct SwiftUIStar_Previews: PreviewProvider {
    struct TestView: View {
        @State var starCount = 4
        var numberOfStar = 9
        var body: some View {
            VStack {
                Text("star count: \(starCount) editingTrue")
                StarView(starCount: numberOfStar, starAmount: $starCount, isEditing: true)
                Text("star count: \(starCount) editingFalse")
                StarView(starCount: numberOfStar, starAmount: $starCount, isEditing: false)
            }
        }
    }
    static var previews: some View {
        TestView()
    }
}
