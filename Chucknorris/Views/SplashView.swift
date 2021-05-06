//
//  SplashView.swift
//  Chucknorris
//
//  Created by Abhijeet Malamkar on 5/6/21.
//

import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
        
        var body: some View {
            VStack {
                if self.isActive {
                    MainView()
                } else {
                    Image("logo")
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}
