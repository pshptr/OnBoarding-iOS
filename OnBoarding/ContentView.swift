//
//  ContentView.swift
//  OnBoarding
//
//  Created by Pe Tia on 18.02.25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isWelcomeSheetShowing") var isWelcomeSheetShowing : Bool = true
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .sheet(isPresented: $isWelcomeSheetShowing) {
            WelcomeView(isWelcomeSheetShowing: $isWelcomeSheetShowing)
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
    PageInfo(label: "You first car without a driver's license", text: "Goes to meet people who just got their license", image: .imageOne),
    PageInfo(label: "Always there: more than 1000 cars in Tbilisi", text: "Our company is a leader by the number of cars in the fleet", image: .imageTwo),
    PageInfo(label: "Do not pay for parking, maintenance and gasoline", text: "We will pay for you, all expenses  related to the car", image: .imageThree),
    PageInfo(label: "29 car models: from Skoda Octavia to Porsche 911", text: "Choose between regular car models and exclusive ones", image: .imageFour),
    
]

struct WelcomeView: View {
    @Binding var isWelcomeSheetShowing: Bool

    var body: some View {
        VStack {
            TabView {
                ForEach(pages) { page in
                    VStack {
                        Text(page.label)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(page.text)
                            .fontWeight(.medium)
                            .padding()
                        
                        Image(page.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                }
            }

            Button {
                isWelcomeSheetShowing.toggle()
            } label: {
                Text("OK")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
            }
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .interactiveDismissDisabled()
        .tabViewStyle(.page)
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .label
            UIPageControl.appearance().pageIndicatorTintColor = .systemGray
            
        }
    }
}
