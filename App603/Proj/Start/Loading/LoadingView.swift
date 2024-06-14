//
//  LoadingView.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("LLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 140)
            }
        }
    }
}

#Preview {
    LoadingView()
}
