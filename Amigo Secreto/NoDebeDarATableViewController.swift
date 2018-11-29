//
//  NoDebeDarATableViewController.swift
//  Amigo Secreto
//
//  Created by Sergio Blanco on 26/11/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import UIKit

class NoDebeDarATableViewController: UITableViewController {

    struct PropertyKeys {
        static let participantCellNot = "participanteCellNot"
    }
    
    var participantes: [Participante] = []
    var calculations = Calculations()
    //var tempDictionary: [String:[Participante]] = [:]
    
    var participanteArchiveURL: URL {
        let participantesURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return participantesURL.appendingPathComponent("participantes")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadParticipantesFromFileNOT()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participantes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.participantCellNot, for: indexPath) as! ParticipanteNotTableViewCell
        
        let participante = participantes[indexPath.row]
        cell.update(with: participante)
        
        return cell
    }
    
    func loadParticipantesFromFileNOT() {
        guard let participantes = NSKeyedUnarchiver.unarchiveObject(withFile: participanteArchiveURL.path) as? [Participante] else {return}
        self.participantes = participantes
    }

}
