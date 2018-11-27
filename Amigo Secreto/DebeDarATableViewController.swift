//
//  DebeDarATableViewController.swift
//  Amigo Secreto
//
//  Created by Sergio Blanco on 26/11/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import UIKit

class DebeDarATableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let participantCellDebe = "participanteCellDebe"
    }
    
    var participantes: [Participante] = []
    
    var participanteArchiveURL: URL {
        let participantesURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return participantesURL.appendingPathComponent("participantes")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadParticipantesFromFileDebe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participantes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.participantCellDebe, for: indexPath) as! ParticipanteDebeTableViewCell
        
        let participante = participantes[indexPath.row]
        cell.update(with: participante)
        
        return cell
    }
    
    func loadParticipantesFromFileDebe() {
        guard let participantes = NSKeyedUnarchiver.unarchiveObject(withFile: participanteArchiveURL.path) as? [Participante] else {return}
        self.participantes = participantes
    }
    
}

