//
//  NoDebeDarAListaTableViewController.swift
//  Amigo Secreto
//
//  Created by Sergio Blanco on 29/11/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import UIKit

class NoDebeDarAListaTableViewController: UITableViewController {

    var participantes: [Participante] = []
    var calculations = Calculations()
    var participantSelected:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculations.conbinacionDict()
        //let temp = calculations.tempDictionary
        
        print("COMBINATIONS \(calculations.participantDictionary)")
        print("Rellenar con: \(String(describing: calculations.participantDictionary[participantSelected]!))")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (calculations.participantDictionary[participantSelected]?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipanteNoDebe", for: indexPath)
        cell.textLabel?.text = calculations.participantDictionary[participantSelected]![indexPath.item]
        return cell
    }

}
