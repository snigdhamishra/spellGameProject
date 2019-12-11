//
//  Characters.swift
//  spellGameProject
//
//  Created by Mishra, Snigdha on 12/9/19.
//  Copyright © 2019 Frisco. All rights reserved.
//

import Foundation

class Character {
    var health: Int
    var energy: Int
    var attackPower: [String: Int]
    
    init( health: Int, energy: Int, attackPower: [String: Int]) {
        self.health = health
        self.energy = energy
        self.attackPower = attackPower
    }
}

class Hero: Character {
    
}

class Enemy: Character {
    
}
