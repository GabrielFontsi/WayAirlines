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
            flightIDLabel.text = "Numero do voo: \(voo?.flight_id ?? "")"
            statusLabel.text = voo?.completion_status
            departureLabel.text = "Partida: \(voo?.departure_airport ?? "")"
            arrivalLabel.text = "Chegada: \(voo?.arrival_airport ?? "")"
            flightTimeLabel.text = "Horário partida: \(voo?.departure_time ?? "")  /  Horário chegada \(voo?.arrival_time ?? "")"
            dateLabel.text = "Data: \(voo?.start_date ?? "")"
            airplaneLabel.text = "Avião: \(voo?.airplane_name ?? "")"
            
            backgroundColorView.setCornerRadius(cornesRadius: 18, typeCorners: [.inferiorDireito, .inferiorEsquerdo, .superiorDireito, .superiorEsquerdo])
            backgroundColorView.setCardShadow()
            
            if voo?.completion_status == "NO HORARIO" {
                     statusLabel.textColor = .green
            } else if voo?.completion_status == "ATRASOU" {
                statusLabel.textColor = .systemYellow
            } else {
                statusLabel.textColor = .red
            }
             }
        }
    }

