//
//  Way_AirlinesTests.swift
//  Way AirlinesTests
//
//  Created by Gabriel Fontenele da Silva on 07/10/24.
//

import XCTest
//import Way_Airlines
@testable import Way_Airlines

final class HomeViewModelTests: XCTestCase {
    
    private var flightService: FlightServiceMock!
    private var viewModel:HomeViewModelImpl!
    override func setUpWithError() throws {
        try super.setUpWithError()
        flightService = FlightServiceMock()
        viewModel = HomeViewModelImpl(flightService: flightService)
    }

    override func tearDownWithError() throws {
        flightService = nil
        viewModel = nil
        try super.tearDownWithError()
    }

    func testFilterOnTime() {
        _ = viewModel.getFlights()
        let result = viewModel.filterFlights(by: "NO HORARIO")
        XCTAssertEqual(result.count, 1)
    }

    func testFilterLate() {
        _ = viewModel.getFlights()
        let result = viewModel.filterFlights(by: "ATRASOU")
        XCTAssertEqual(result.count, 2)
    }

    func testFilterAll() {
        _ = viewModel.getFlights()
        let result = viewModel.filterFlights(by: "CANCELADO")
        XCTAssertEqual(result.count, 3)
    }

    func testFilterCancelled() {
        _ = viewModel.getFlights()
        let result = viewModel.filterFlights(by: "TODOS")
        XCTAssertEqual(result.count, 6)
    }
}

class FlightServiceMock: FlightService {
    func fetchFlights() -> [Flight] {
        let flight1 = Flight(flight_id: "", status: "", completion_status: "NO HORARIO", start_date: "", end_date: "", departure_time: "", arrival_time: "", departure_airport: "", arrival_airport: "", airplane_name: "")
        let flight2 = Flight(flight_id: "", status: "", completion_status: "ATRASOU", start_date: "", end_date: "", departure_time: "", arrival_time: "", departure_airport: "", arrival_airport: "", airplane_name: "")
        let flight3 = Flight(flight_id: "", status: "", completion_status: "ATRASOU", start_date: "", end_date: "", departure_time: "", arrival_time: "", departure_airport: "", arrival_airport: "", airplane_name: "")
        let flight4 = Flight(flight_id: "", status: "", completion_status: "CANCELADO", start_date: "", end_date: "", departure_time: "", arrival_time: "", departure_airport: "", arrival_airport: "", airplane_name: "")
        let flight5 = Flight(flight_id: "", status: "", completion_status: "CANCELADO", start_date: "", end_date: "", departure_time: "", arrival_time: "", departure_airport: "", arrival_airport: "", airplane_name: "")
        let flight6 = Flight(flight_id: "", status: "", completion_status: "CANCELADO", start_date: "", end_date: "", departure_time: "", arrival_time: "", departure_airport: "", arrival_airport: "", airplane_name: "")
        return [flight1, flight2, flight3, flight4, flight5, flight6]
    }
}


