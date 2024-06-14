//
//  U1.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
                            
                VStack {
                    
                    Image("U1")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                VStack {
                    
                    Text("Just one step separates you from victory")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top, 40)

                    
                    Spacer()
                    
                    VStack {

                            NavigationLink(destination: {
                                
                                Reviews()
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                Text("Next")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            })
                        
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
                .ignoresSafeArea()

        }
    }
}

#Preview {
    U1()
}
