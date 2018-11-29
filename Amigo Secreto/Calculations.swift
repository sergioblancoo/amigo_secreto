//
//  Calculations.swift
//  Amigo Secreto
//
//  Created by Sergio Blanco on 29/11/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import Foundation

struct Calculations {
    
    var participantes: [Participante] = []
    var tempDictionary: [String:[Participante]] = [:]
    
    mutating func conbinacionDict() {
        
        loadParticipantesFromFileDebe()
        
        print("COOOOOOOOUUUUUNNNNNNTTTTTTT: \(participantes.count)")
        
        for i in 0..<participantes.count {
            //let temp: String = participantes[i].name
            tempDictionary[participantes[i].name] = participantes.filter{ $0 != participantes[i]}
            //temp.filter{ $0 != participantes[i].name}
        }
        let temp = tempDictionary[participantes[0].name]![0].name
        let temp1 = tempDictionary[participantes[0].name]![1].name
        let temp2 = tempDictionary[participantes[0].name]![2].name
        print("\(temp), \(temp1), \(temp2)")
        
        let temp3 = tempDictionary[participantes[1].name]![0].name
        let temp4 = tempDictionary[participantes[1].name]![1].name
        let temp5 = tempDictionary[participantes[1].name]![2].name
        print("\(temp3), \(temp4), \(temp5)")
        
        let temp6 = tempDictionary[participantes[2].name]![0].name
        let temp7 = tempDictionary[participantes[2].name]![1].name
        let temp8 = tempDictionary[participantes[2].name]![2].name
        print("\(temp6), \(temp7), \(temp8)")
        
        let temp9 = tempDictionary[participantes[3].name]![0].name
        let temp10 = tempDictionary[participantes[3].name]![1].name
        let temp11 = tempDictionary[participantes[3].name]![2].name
        print("\(temp9), \(temp10), \(temp11)")
        
        
    }
    
    var participanteArchiveURL: URL {
        let participantesURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return participantesURL.appendingPathComponent("participantes")
    }
    
    mutating func loadParticipantesFromFileDebe() {
        guard let participantes = NSKeyedUnarchiver.unarchiveObject(withFile: participanteArchiveURL.path) as? [Participante] else {return}
        self.participantes = participantes
    }
}
