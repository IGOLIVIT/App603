//
//  R1.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
                            
                VStack {
                    
                    Image("R1")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                VStack {
                    
                    Text("Your favorite teams are already on your phone")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    VStack {

                            NavigationLink(destination: {
                                
                                R2()
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
                    .frame(height: 110)
                    .background(Rectangle().fill(.white))

                }
                .ignoresSafeArea()

        }
    }
}

#Preview {
    R1()
}
