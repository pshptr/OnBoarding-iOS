//
//  ContentView.swift
//  OnBoarding
//
//  Created by Pe Tia on 18.02.25.
//

import SwiftUI

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

struct ContentView: View {
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {
        ZStack {
            viewModel.backgroundColor(for: viewModel.currentPageIndex)
                .ignoresSafeArea()
            TabView(selection: $viewModel.currentPageIndex) {
                ForEach(Array(viewModel.pages.enumerated()), id: \.element.id) { index, page in
                    VStack {
                        Text(page.label)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding()
                            .foregroundColor(.white)
                        
                        Text(page.text)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding()
                            .foregroundColor(.white)
                        
                        Image(page.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .label
                UIPageControl.appearance().pageIndicatorTintColor = .systemGray
            }
        }
    }
}

#Preview {
    WelcomeView(isWelcomeSheetShowing: .constant(true))
}
struct PageInfo: Identifiable {
    let id = UUID()
    let label: String
    let text: String
    let image: ImageResource
}

let pages = [
    PageInfo(label: "You first car without a driver's license", text: "Goes to meet people who just got their license", image: .screenOne),
    PageInfo(label: "Always there: more than 1000 cars in Tbilisi", text: "Our company is a leader by the number of cars in the fleet", image: .screenTwo),
    PageInfo(label: "Do not pay for parking, maintenance and gasoline", text: "We will pay for you, all expenses  related to the car", image: .screenThree),
    PageInfo(label: "29 car models: from Skoda Octavia to Porsche 911", text: "Choose between regular car models and exclusive ones", image: .screenFour),
    PageInfo(label: "", text: "You are a clever person!", image: .screenOne),
    
]

struct WelcomeView: View {
    @Binding var isWelcomeSheetShowing: Bool

    var body: some View {
        ZStack {
            TabView {
                ForEach(Array(pages.enumerated()), id: \.element.id) { index, page in
                    ZStack {
                        backgroundColor(for: index)
                            .ignoresSafeArea() // Ensure background fills the screen
                        PageView(page: page, backgroundColor: backgroundColor(for: index))
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .interactiveDismissDisabled()
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .label
                UIPageControl.appearance().pageIndicatorTintColor = .systemGray
            }
        }
    }
    
    private func backgroundColor(for index: Int) -> Color {
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

struct PageView: View {
    let page: PageInfo
    let backgroundColor: Color

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            VStack {
                Text(page.label)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                
                Text(page.text)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .foregroundColor(.white)
                
                Image(page.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(1.2)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.vertical)
        }
        .ignoresSafeArea()
    }
}

class OnboardingViewModel: ObservableObject {
    @Published var currentPageIndex: Int = 0
    let pages: [PageInfo] = [
        // Define your pages here
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
