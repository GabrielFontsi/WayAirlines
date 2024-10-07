//
//  FlightService.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 07/10/24.
//

import Foundation

protocol FlightService {
    func fetchFlights() -> [Flight]
}

class FlightServiceImpl: FlightService {
    func fetchFlights() -> [Flight] {
        guard let url = Bundle.main.url(forResource: "Mock", withExtension: "json"), let data = try? Data(contentsOf: url)  else { return [] }
            let response = try? JSONDecoder().decode(FlightResponse.self, from: data)
            return response?.flights ?? []
    }
}
