//
//  CompDetail.swift
//  App603
//
//  Created by IGOR on 12/06/2024.
//

import SwiftUI
import CoreData

struct CompDetail: View {
    
    @StateObject var viewModel: CompetitionsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
                        }
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    })
                    
                    Spacer()
                    
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Image(viewModel.selectedCompetition?.coPhoto ?? "")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 160)
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text(viewModel.selectedCompetition?.coName ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text(viewModel.selectedCompetition?.coLocation ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 11, weight: .regular))
                        }
                        
                        Spacer()
                        
                        Text(viewModel.selectedCompetition?.coDate ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .padding()
                    
                    Text("Team")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(viewModel.teams, id: \.self) { index in
                     
                        HStack {
                            
                            Image(index.tPhoto ?? "")
                                .resizable()
                                .frame(width: 45, height: 45)
                            
                            VStack {
                                
                                Text(index.tName ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text(index.tCategory ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11, weight: .regular))
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .black.opacity(0.2), radius: 5))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    }
                    
                    Text("Player")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(viewModel.players, id: \.self) { index in
                     
                        HStack {
                            
                            Image(index.pPhoto ?? "")
                                .resizable()
                                .frame(width: 45, height: 45)
                            
                            VStack {
                                
                                Text(index.pName ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text(index.pCategory ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11, weight: .regular))
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .black.opacity(0.2), radius: 5))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                            
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Spacer()
                            
                            Text("Delete competition")
                                .foregroundColor(.red)
                                .font(.system(size: 13, weight: .semibold))
                            
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .font(.system(size: 15, weight: .semibold))
                        }
                    })
                }
            }
            .padding()
        }
        .onAppear{
            
            viewModel.fetchTeam()
        }
        .onAppear {
            
            viewModel.fetchPlayers()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteComp(withCoName: viewModel.selectedCompetition?.coName ?? "", completion: {
                            
                            viewModel.fetchCompetitions()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    CompDetail(viewModel: CompetitionsViewModel())
}
