//
//  R3.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
                            
                VStack {
                    
                    Image("R3")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                VStack {
                    
                    Text("Control your plans with one click")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    VStack {

                            Button(action: {
                                
                                status = true
                                
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
    R3()
}
