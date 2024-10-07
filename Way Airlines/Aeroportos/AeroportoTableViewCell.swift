//
//  AeroportoTableViewCell.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 07/10/24.
//

import UIKit

class AeroportoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var backgroundColorImageView: UIView!
    @IBOutlet weak var airportImageView: UIImageView!
    @IBOutlet weak var airportLabel: UILabel!
    
    var aeroporto: Flight? {
        didSet {
            
            backgroundColorImageView.setCornerRadius(cornesRadius: 18, typeCorners: [.inferiorDireito, .inferiorEsquerdo, .superiorDireito, .superiorEsquerdo])
            backgroundColorImageView.setCardShadow()
            
            airportImageView.image = UIImage(named: "airport02")
            airportLabel.text = aeroporto?.departure_airport
            
        }
    }
    
}
