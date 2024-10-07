//
//  HomeViewModel.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 06/10/24.
//

import Foundation

protocol HomeViewModel {
    func getFlights() -> [Flight]
    func filterFlights(by status: String) -> [Flight]
}

class HomeViewModelImpl: HomeViewModel {
    
    private var flights = [Flight]()
    private let flightService: FlightService

    init(flightService: FlightService) {
        self.flightService = flightService
    }

    func getFlights() -> [Flight] {
    self.flights = flightService.fetchFlights()
        return flights
    }
    
    func filterFlights(by status: String) -> [Flight] {
        if status == "TODOS" {
        return flights
        } else {
            return flights.filter { $0.completion_status == status }
        }
    }
}
