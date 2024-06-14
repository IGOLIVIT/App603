//
//  Not.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI

struct Not: View {

    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
                            
                VStack {
                    
                    Image("Not")
                        .resizable()
                        .ignoresSafeArea()
                }
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Spacer()
            }
            
            VStack {
                
                Text("Don’t miss anything")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                
                Spacer()
            }
            .padding()
                
                VStack {
                    
                    Spacer()
                    
                    VStack {

                            Button(action: {
                                
                                status = true
                                
                            }, label: {
                                
                                Text("Enable notifications")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(height: 50)
                                    .frame(maxWidth: .infinity)
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
    Not()
}
