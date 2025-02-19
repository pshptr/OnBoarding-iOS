//
//  ScreenOneView.swift
//  OnBoarding
//
//  Created by Pe Tia on 19.02.25.
//

import SwiftUI

struct ScreenOneView: View {
    let page: PageInfo
    let backgroundColor: Color

    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ScreenOneView(page: PageInfo(label: "Sample", text: "Sample Text", image: .screenOne), backgroundColor: .blue)
}
