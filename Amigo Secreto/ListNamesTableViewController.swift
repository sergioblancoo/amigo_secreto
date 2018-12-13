//
//  ListNamesTableViewController.swift
//  Amigo Secreto
//
//  Created by Sergio Blanco on 23/11/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import UIKit

class ListNamesTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let participanteCell = "ParticipanteCell"
        static let addParticipanteSegue = "AddParticipante"
        static let editParticipanteSegue = "EditParticipante"
    }

    var participantes: [Participante] = []
    
    var participanteArchiveURL: URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsURL.appendingPathComponent("participantes")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadParticipantesFromFile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participantes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.participanteCell, for: indexPath) as! ParticipanteTableViewCell
        
        let participante = participantes[indexPath.row]
        cell.update(with: participante)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            participantes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            saveParticipantesToFile()
        }
    }
    
    func saveParticipantesToFile() {
        NSKeyedArchiver.archiveRootObject(participantes, toFile: participanteArchiveURL.path)
    }
    
    func loadParticipantesFromFile() {
        guard let participantes = NSKeyedUnarchiver.unarchiveObject(withFile: participanteArchiveURL.path) as? [Participante] else {return}
        self.participantes = participantes
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        guard let source = segue.source as? ParticipanteFormTableViewController,
            let participante = source.participante else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow {
            participantes.remove(at: indexPath.row)
            participantes.insert(participante, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            participantes.append(participante)
        }
        
        saveParticipantesToFile()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let participanteFormViewController = segue.destination as? ParticipanteFormTableViewController else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == PropertyKeys.editParticipanteSegue { participanteFormViewController.participante = participantes[indexPath.row]}
    }

}
