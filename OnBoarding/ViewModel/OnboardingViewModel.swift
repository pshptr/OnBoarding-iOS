import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var isWelcomeSheetShowing: Bool = true
    let pages: [PageInfo] = [
        PageInfo(label: "Your first car without a driver's license", text: "Goes to meet people who just got their license", image: .screenOne),
        PageInfo(label: "Always there: more than 1000 cars in Tbilisi", text: "Our company is a leader by the number of cars in the fleet", image: .screenTwo),
        PageInfo(label: "Do not pay for parking, maintenance and gasoline", text: "We will pay for you, all expenses related to the car", image: .screenThree),
        PageInfo(label: "29 car models: from Skoda Octavia to Porsche 911", text: "Choose between regular car models and exclusive ones", image: .screenFour),
        PageInfo(label: "", text: "You are a clever person!", image: .screenOne)
    ]
    
    func backgroundColor(for index: Int) -> Color {
        switch index {
        case 0: return Color(red: 1.0, green: 0.0, blue: 0.0)
        case 1: return Color(red: 0.0, green: 1.0, blue: 0.0)
        case 2: return Color(red: 0.0, green: 0.0, blue: 1.0)
        case 3: return Color(red: 1.0, green: 1.0, blue: 0.0)
        case 4: return Color(red: 0.5, green: 0.0, blue: 0.5)
        default: return Color(red: 1.0, green: 1.0, blue: 1.0)
        }
    }
} 
