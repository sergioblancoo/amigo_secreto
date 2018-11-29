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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        calculations.conbinacionDict()
        let temp = calculations.tempDictionary
        
        print("YEAHHHHHHH \(temp)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return
//    }

}
