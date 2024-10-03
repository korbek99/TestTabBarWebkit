//
//  PeopleViewModel.swift
//  SwiftTabBar
//
//  Created by Jose Preatorian on 05-04-18.
//  Copyright © 2018 Jose Preatorian. All rights reserved.
//

import Foundation

class PeopleViewModel {
    private var allPeoples: [Person] = peopleList
    var filteredPeoples: [Person] = []
    
    init() {
        filteredPeoples = allPeoples 
    }
    
    func numberOfRows() -> Int {
        return filteredPeoples.count
    }
    
    func person(at index: Int) -> Person {
        return filteredPeoples[index]
    }
    
    func filterPeoples(with searchText: String) {
        if searchText.isEmpty {
            filteredPeoples = allPeoples // Mostrar todos si no hay texto
        } else {
            filteredPeoples = allPeoples.filter { person in
                return person.firstName.lowercased().contains(searchText.lowercased()) ||
                       person.lastName.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

