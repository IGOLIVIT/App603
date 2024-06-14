//
//  CompetitionsViewModel.swift
//  App603
//
//  Created by IGOR on 11/06/2024.
//

import SwiftUI
import CoreData

final class CompetitionsViewModel: ObservableObject {
    
    @Published var photos: [String] = ["1", "2", "3"]
    @Published var currentPhoto = ""

    @Published var isAdd: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddPlayer: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddTeam: Bool = false
    
    @AppStorage("pl") var pl: [String] = []
    @AppStorage("tm") var tm: [String] = []
    
    @Published var teamDetail = ""
    @Published var playerDetail = ""
    
    @Published var currentTeam = ""
    @Published var currentPlayer = ""

    @Published var coPhoto = ""
    @Published var coName = ""
    @Published var coLocation = ""
    @Published var coDate = ""
    @Published var coTeam = ""
    @Published var coPlayer = ""

    @Published var competitions: [CompModel] = []
    @Published var selectedCompetition: CompModel?
    
    func addCompetition() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CompModel", into: context) as! CompModel
        
        loan.coPhoto = coPhoto
        loan.coName = coName
        loan.coLocation = coLocation
        loan.coDate = coDate
        loan.coTeam = coTeam
        loan.coPlayer = coPlayer

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCompetitions() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CompModel>(entityName: "CompModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.competitions = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.competitions = []
        }
    }
    
    @Published var teams: [TeamsModel] = []
    @Published var selectedTeam: TeamsModel?
    
    func fetchTeam() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TeamsModel>(entityName: "TeamsModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.teams = result.filter{($0.tName ?? "") == teamDetail}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.teams = []
        }
    }
    
    @Published var players: [PlayersModel] = []
    @Published var selectedPlayer: PlayersModel?
    
    func fetchPlayers() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlayersModel>(entityName: "PlayersModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.players = result.filter{($0.pName ?? "") == playerDetail}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.players = []
        }
    }
}
