import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentPageIndex: Int = 0
    let pages: [PageInfo] = [
        PageInfo(label: "Your first car without a driver's license", text: "Goes to meet people who just got their license", image: .screenOne),
        PageInfo(label: "Always there: more than 1000 cars in Tbilisi", text: "Our company is a leader by the number of cars in the fleet", image: .screenTwo),
        PageInfo(label: "Do not pay for parking, maintenance and gasoline", text: "We will pay for you, all expenses related to the car", image: .screenThree),
        PageInfo(label: "29 car models: from Skoda Octavia to Porsche 911", text: "Choose between regular car models and exclusive ones", image: .screenFour),
        PageInfo(label: "", text: "You are a clever person!", image: .screenOne)
    ]
    
    func backgroundColor(for index: Int) -> Color {
        switch index {
        case 0: return Color(UIColor(hex: "#F0CF69"))
        case 1: return Color(UIColor(hex: "#B7ABFD"))
        case 2: return Color(UIColor(hex: "#EFB491"))
        case 3: return Color(UIColor(hex: "#95B6FF"))
        case 4: return Color(UIColor(hex: "#95B6FF"))
        default: return Color(UIColor(hex: "#FFFFFF"))
        }
    }
} 
