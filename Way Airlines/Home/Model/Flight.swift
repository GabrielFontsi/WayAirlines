//
//  Voo.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 06/10/24.
//

import Foundation

struct Flight: Decodable {
    var flight_id: String
    var status: String
    var completion_status: String
    var start_date: String
    var end_date: String
    var departure_time: String
    var arrival_time: String
    var departure_airport: String
    var arrival_airport: String
    var airplane_name: String
}

struct FlightResponse: Decodable {
    let flights: [Flight]
}

