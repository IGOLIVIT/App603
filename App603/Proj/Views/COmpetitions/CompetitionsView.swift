//
//  CompetitionsView.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI

struct CompetitionsView: View {

    @StateObject var viewModel = CompetitionsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Competitions")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("Add a new competition")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .regular))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.competitions, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedCompetition = index
                                
                                viewModel.teamDetail = viewModel.selectedCompetition?.coTeam ?? ""
                                viewModel.playerDetail = viewModel.selectedCompetition?.coPlayer ?? ""
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(index.coPhoto ?? "")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text(index.coDate ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text(index.coName ?? "")
                                            .foregroundColor(.black)
                                        
                                        Text(index.coLocation ?? "")
                                            .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 24, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            })
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchCompetitions()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddCompetition(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            CompDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    CompetitionsView()
}
