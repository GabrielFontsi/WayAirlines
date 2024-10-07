//
//  VooTableViewCell.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 06/10/24.
//

import UIKit

class VooTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var flightIDLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var flightTimeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var airplaneLabel: UILabel!
    
    var voo: Flight? {
        didSet {
            flightIDLabel.text = voo?.flight_id
            statusLabel.text = voo?.status
            departureLabel.text = "Partida: \(voo?.departure_airport ?? "")"
            arrivalLabel.text = "Chegada: \(voo?.arrival_airport ?? "")"
            flightTimeLabel.text = "Horários: \(voo?.departure_time ?? "") \(voo?.arrival_time ?? "")"
            dateLabel.text = "Data: \(voo?.start_date ?? "")"
            airplaneLabel.text = "Avião: \(voo?.airplane_name ?? "")"
            
            backgroundColorView.setCornerRadius(cornesRadius: 18, typeCorners: [.inferiorDireito, .inferiorEsquerdo, .superiorDireito, .superiorEsquerdo])
            backgroundColorView.setCardShadow()
            
            if voo?.status == "CONCLUIDO" {
                     statusLabel.textColor = .green
                 } else {
                     statusLabel.textColor = .red
                 }
             }
        }
    }

