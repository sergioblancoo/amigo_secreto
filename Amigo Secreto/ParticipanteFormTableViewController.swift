//
//  ParticipanteFormTableViewController.swift
//  Amigo Secreto
//
//  Created by Sergio Blanco on 26/11/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import UIKit

class ParticipanteFormTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let unwind = "UnwindToParticipanteTable"
    }
    
    var participante: Participante?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        guard let participante = participante else {return}
        
        nameTextField.text = participante.name
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        participante = Participante(name: name)
        performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
    }
    
    
}
