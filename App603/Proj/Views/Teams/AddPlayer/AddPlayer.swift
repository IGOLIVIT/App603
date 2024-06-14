//
//  AddPlayer.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI

struct AddPlayer: View {
    
    @StateObject var viewModel: TeamsViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
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
                    
                    Button(action: {
                        
                        viewModel.pl.append(viewModel.pName)
                        
                        viewModel.pPhoto = viewModel.currentPhoto
                        
                        viewModel.pCategory = viewModel.currentCategory
                        
                        viewModel.addPlayer()
                        
                        viewModel.currentPhoto = ""
                        viewModel.currentCategory = ""
                        viewModel.pName = ""
                        viewModel.pCommand = ""
                        viewModel.pCountry = ""
                        
                        viewModel.fetchPlayers()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddPlayer = false
                        }
                        
                    }, label: {

                        Text("Save")
                            .foregroundColor(.green)
                            .font(.system(size: 15, weight: .semibold))
                    })
                    .opacity(viewModel.currentPhoto.isEmpty || viewModel.currentCategory.isEmpty || viewModel.pName.isEmpty || viewModel.pWinrate.isEmpty || viewModel.pCountry.isEmpty || viewModel.pCommand.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currentPhoto.isEmpty || viewModel.currentCategory.isEmpty || viewModel.pName.isEmpty || viewModel.pWinrate.isEmpty || viewModel.pCountry.isEmpty || viewModel.pCommand.isEmpty ? true : false)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.photos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                      
                                })
                                
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("prim"))
                                    .padding(35)
                                    .background(Circle().stroke(Color("prim")))
                                
                            } else {
                                
                                Image(viewModel.currentPhoto)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 90)
                            }
                            
                        })
                        .padding(.vertical)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.pName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.pName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                ForEach(viewModel.categories, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentCategory = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currentCategory == index ? .white : .gray.opacity(0.4))
                                            .font(.system(size: 13, weight: .medium))
                                            .padding(10)
                                            .padding(.horizontal, 8)
                                            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(viewModel.currentCategory == index ? 0 : 0.4)))
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(viewModel.currentCategory == index ? 1 : 0)))
                                            .padding(1)
                                    })
                                }
                            }
                        }
                        .frame(height: 60)
                        
                        Text("Winrate")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.pWinrate.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.pWinrate)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                        
                        Text("Country")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.pCountry.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.pCountry)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                        
                        Text("Current command")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.pCommand.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.pCommand)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                        
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddPlayer(viewModel: TeamsViewModel())
}
