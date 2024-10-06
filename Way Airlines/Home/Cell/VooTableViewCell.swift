//
//  VooTableViewCell.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 06/10/24.
//

import UIKit

class VooTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var horarioLabel: UILabel!
    
    var voo: Flight? {
        didSet {
            horarioLabel.text = voo?.arrival_time
        }
    }
}
