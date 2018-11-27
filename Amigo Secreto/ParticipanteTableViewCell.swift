//
//  ParticipanteTableViewCell.swift
//  Amigo Secreto
//
//  Created by Sergio Blanco on 26/11/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import UIKit

class ParticipanteTableViewCell: UITableViewCell {
  
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(with participante: Participante) {
        nameLabel.text = participante.name
    }
}
