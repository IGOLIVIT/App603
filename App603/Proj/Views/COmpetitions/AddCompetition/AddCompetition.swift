//
//  AddCompetition.swift
//  App603
//
//  Created by IGOR on 12/06/2024.
//

import SwiftUI

struct AddCompetition: View {

    @StateObject var viewModel: CompetitionsViewModel
    
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
                        
                        viewModel.coPlayer = viewModel.currentPlayer
                        viewModel.coTeam = viewModel.currentTeam
                        
                        viewModel.coPhoto = viewModel.currentPhoto
                        
                        viewModel.addCompetition()
                        
                        viewModel.coName = ""
                        viewModel.coDate = ""
                        viewModel.coLocation = ""
                        
                        viewModel.currentTeam = ""
                        viewModel.currentTeam = ""
                        viewModel.currentPlayer = ""
                        
                        viewModel.fetchCompetitions()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {

                        Text("Save")
                            .foregroundColor(.green)
                            .font(.system(size: 15, weight: .semibold))
                    })
                    .opacity(viewModel.currentPhoto.isEmpty || viewModel.coName.isEmpty || viewModel.coDate.isEmpty || viewModel.coLocation.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currentPhoto.isEmpty || viewModel.coName.isEmpty || viewModel.coDate.isEmpty || viewModel.coLocation.isEmpty ? true : false)
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
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 160)
                                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                                
                            } else {
                                
                                Image(viewModel.currentPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 160)
                            }
                            
                        })
                        .padding(.vertical)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.coName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.coName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))

                        ZStack(alignment: .leading, content: {
                            
                            Text("Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.coDate.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.coDate)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))

                        ZStack(alignment: .leading, content: {
                            
                            Text("Location")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.coLocation.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.coLocation)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                        
                        Text("Team")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Menu(content: {
                            
                            ForEach(viewModel.tm, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentTeam = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentTeam.isEmpty {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                    .frame(width: 55, height: 75)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .black.opacity(0.2), radius: 5))
                                
                            } else {
                                
                                Text(viewModel.currentTeam)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .semibold))
                                    .frame(height: 75)
                                    .padding(.horizontal)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .black.opacity(0.2), radius: 5))

                            }
                            
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Player")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Menu(content: {
                            
                            ForEach(viewModel.pl, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentPlayer = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPlayer.isEmpty {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                    .frame(width: 55, height: 75)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .black.opacity(0.2), radius: 5))
                                
                            } else {
                                
                                Text(viewModel.currentPlayer)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .semibold))
                                    .frame(height: 75)
                                    .padding(.horizontal)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .black.opacity(0.2), radius: 5))

                            }
                            
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddCompetition(viewModel: CompetitionsViewModel())
}
