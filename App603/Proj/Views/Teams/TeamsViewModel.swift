//
//  TeamsViewModel.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI
import CoreData

final class TeamsViewModel: ObservableObject {
    
    @Published var photos: [String] = ["av11", "av2", "av3"]
    @Published var currentPhoto = ""
    
    @Published var currentTeamPhoto = ""
    
    @AppStorage("pl") var pl: [String] = []
    @AppStorage("tm") var tm: [String] = []
    
    @AppStorage("categoties") var categories: [String] = ["All"]
    @Published var category = ""
    @Published var currentCategory = "All"

    @Published var teamPhotos: [String] = ["tm1", "tm2", "tm3", "tm4"]
    @Published var currentT1Photo = ""
    @Published var currentT2Photo = ""
    
    @Published var isAdd: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddPlayer: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddTeam: Bool = false
    
    @Published var currentGame = ""

    @Published var tPhoto = ""
    @Published var tCategory = ""
    @Published var tName = ""
    @Published var tWinrate = ""
    @Published var tCountry = ""

    @Published var teams: [TeamsModel] = []
    @Published var selectedTeam: TeamsModel?
    
    func addTeam() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TeamsModel", into: context) as! TeamsModel
        
        loan.tPhoto = tPhoto
        loan.tCategory = tCategory
        loan.tName = tName
        loan.tWinrate = tWinrate
        loan.tCountry = tCountry

        CoreDataStack.shared.saveContext()
    }
    
    func fetchTeam() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TeamsModel>(entityName: "TeamsModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.teams = result.filter{($0.tCategory ?? "") == currentCategory}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.teams = []
        }
    }
    
    @Published var pPhoto = ""
    @Published var pName = ""
    @Published var pCategory = ""
    @Published var pWinrate = ""
    @Published var pCountry = ""
    @Published var pCommand = ""

    @Published var players: [PlayersModel] = []
    @Published var selectedPlayer: PlayersModel?
    
    func addPlayer() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlayersModel", into: context) as! PlayersModel
        
        loan.pPhoto = pPhoto
        loan.pName = pName
        loan.pCategory = pCategory
        loan.pWinrate = pWinrate
        loan.pCountry = pCountry
        loan.pCommand = pCommand

        CoreDataStack.shared.saveContext()
    }
    
    func fetchPlayers() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlayersModel>(entityName: "PlayersModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.players = result.filter{($0.pCategory ?? "") == currentCategory}

        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.players = []
        }
    }
}
