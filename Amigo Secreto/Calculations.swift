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
    var participantDictionary: [String:[String]] = [:]
    
    
    mutating func conbinacionDict() {
        
        loadParticipantesFromFileDebe()
        
        //print("COOOOOOOOUUUUUNNNNNNTTTTTTT: \(participantes.count)")
        
        for i in 0..<participantes.count {
            var userCombinations: [String] = []
            //let temp: String = participantes[i].name
            tempDictionary[participantes[i].name] = participantes.filter{ $0 != participantes[i]}
            //print(" ####> \(participantes[i].name)")
            //print(" ****> \(String(describing: tempDictionary.keys))")
            
            for j in 0..<tempDictionary[participantes[i].name]!.count
            {
                //participantDictionary[]
                
                
                userCombinations.append(tempDictionary[participantes[i].name]![j].name)
                
                //print(" ---->  \(userCombinations)")
            }
            participantDictionary[participantes[i].name] = userCombinations
            //print(" ====> \(participantDictionary)")
            //temp.filter{ $0 != participantes[i].name}
        }
        
//        for i in tempDictionary.count {
//            print(i)
//        }
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
