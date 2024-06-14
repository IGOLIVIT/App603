//
//  TeamsView.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI

struct TeamsView: View {
    
    @StateObject var viewModel = TeamsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Teams and players")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCat = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(width: 60, height: 45)
                                .background(RoundedRectangle(cornerRadius: 12).stroke(.white))
                                .padding(1)
                        })
                        
                        ForEach(viewModel.categories, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCategory = index
                                viewModel.fetchTeam()
                                viewModel.fetchPlayers()
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.horizontal)
                                    .frame(height: 45)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(viewModel.currentCategory == index ? Color("prim") : .white.opacity(0.1)))
                            })
                        }
                    }
                }
                .frame(height: 60)
                
                HStack {
                    
                    Text("Teams")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddTeam = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    })
                }
                .padding(.vertical, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHStack {
                        
                        ForEach(viewModel.teams, id: \.self) { index in
                        
                            VStack {
                                
                                Image(index.tPhoto ?? "")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                
                                Text(index.tName ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text(index.tCategory ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        }
                    }
                }
                .frame(height: 150)
                
                HStack {
                    
                    Text("Players")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddPlayer = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    })
                }
                .padding(.vertical, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHStack {
                        
                        ForEach(viewModel.players, id: \.self) { index in
                            
                            VStack {
                                
                                Image(index.pPhoto ?? "")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                
                                Text(index.pName ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text(index.pCategory ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        }
                    }
                }
                .frame(height: 150)

                Spacer()
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Image("bgi").resizable().aspectRatio(contentMode: .fill))
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddCat ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCat = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCat = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Create a category")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Category")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.category.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.category)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("bg")))
                    .padding(1)
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        viewModel.categories.append(viewModel.category)
                        
                        viewModel.category = ""
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCat = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Create")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                    })
                    .opacity(viewModel.category.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.category.isEmpty ? true : false)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isAddCat ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isAddTeam, content: {
            
            AddTeam(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddPlayer, content: {
            
            AddPlayer(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchTeam()
        }
        .onAppear{
            
            viewModel.fetchPlayers()
        }
    }
}

#Preview {
    TeamsView()
}
