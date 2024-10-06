//
//  HomeViewModel.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 06/10/24.
//

import Foundation

class HomeViewModel {
    
    func listaDeVoos(status: String?) -> [Flight] {
      let flights = getFlightsFromJson()
        return flights
    }
    
    func getFlightsFromJson() -> [Flight] {
            guard let url = Bundle.main.url(forResource: "Mock", withExtension: "json"), let data = try? Data(contentsOf: url)  else { return [] }
        let response = try? JSONDecoder().decode(FlightResponse.self, from: data)
        return response?.flights ?? []
        }

}
