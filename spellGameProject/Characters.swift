//
//  Characters.swift
//  spellGameProject
//
//  Created by Mishra, Snigdha on 12/11/19.
//  Copyright © 2019 Frisco. All rights reserved.
//


import Foundation

class Character {
    var health: Int
    var energy: Int
    var attackDamage: Int
    
    init( health: Int, energy: Int, attackDamage: Int) {
        self.health = health
        self.energy = energy
        self.attackDamage = attackDamage
    }
}

class Hero: Character {
    
    
    init(health: Int, energy: Int) {
        super.init(health: 100, energy: 100, attackDamage: 10)
        
    }
}

class Enemy: Character {
    
    
    init(health: Int, energy: Int) {
        super.init(health: 100, energy: 100, attackDamage: 10)
        
    }
    
}
