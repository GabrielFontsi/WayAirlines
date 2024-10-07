//
//  HomeViewModel.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 06/10/24.
//

import Foundation

class HomeViewModel {
    
    private var flights = [Flight]()
    
    func listaDeVoos() -> [Flight] {
    self.flights = getFlightsFromJson()
        return flights
    }

    func getFlightsFromJson() -> [Flight] {
            guard let url = Bundle.main.url(forResource: "Mock", withExtension: "json"), let data = try? Data(contentsOf: url)  else { return [] }
        let response = try? JSONDecoder().decode(FlightResponse.self, from: data)
        return response?.flights ?? []
        }
    
    func filterFlights(by status: String) -> [Flight] {
        if status == "TODOS" {
        return flights
        } else {
            return flights.filter { $0.completion_status == status }
        }
    }
}
