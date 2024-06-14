//
//  AddTeam.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI

struct AddTeam: View {

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
                        
                        viewModel.tm.append(viewModel.tName)
                        
                        viewModel.tPhoto = viewModel.currentTeamPhoto
                        
                        viewModel.tCategory = viewModel.currentCategory
                        
                        viewModel.addTeam()
                        
                        viewModel.currentTeamPhoto = ""
                        viewModel.currentCategory = ""
                        viewModel.tName = ""
                        viewModel.tCountry = ""
                        
                        viewModel.fetchTeam()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddTeam = false
                        }
                        
                    }, label: {

                        Text("Save")
                            .foregroundColor(.green)
                            .font(.system(size: 15, weight: .semibold))
                    })
                    .opacity(viewModel.currentTeamPhoto.isEmpty || viewModel.currentCategory.isEmpty || viewModel.tName.isEmpty || viewModel.tWinrate.isEmpty || viewModel.tCountry.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currentTeamPhoto.isEmpty || viewModel.currentCategory.isEmpty || viewModel.tName.isEmpty || viewModel.tWinrate.isEmpty || viewModel.tCountry.isEmpty ? true : false)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.teamPhotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentTeamPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                                
                            }
                            
                        }, label: {
                            
                            if viewModel.currentTeamPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("prim"))
                                    .padding(35)
                                    .background(Circle().stroke(Color("prim")))
                                
                            } else {
                                
                                Image(viewModel.currentTeamPhoto)
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
                                .opacity(viewModel.tName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.tName)
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
                                .opacity(viewModel.tWinrate.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.tWinrate)
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
                                .opacity(viewModel.tCountry.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.tCountry)
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
    AddTeam(viewModel: TeamsViewModel())
}
