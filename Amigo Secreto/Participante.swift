//
//  Data.swift
//  Amigo Secreto
//
//  Created by Sergio Blanco on 26/11/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import Foundation

class Participante: NSObject, NSCoding {
    
    struct PropertyKeys {
        static let name = "name"
    }
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKeys.name) as? String else {return nil}
        
        self.init(name: name)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKeys.name)
    }
    
    var participantes: [Participante] = []
    
    
    
    
}
