//
//  Characters.swift
//  spellGameProject
//
//  Created by Mishra, Snigdha on 12/11/19.
//  Copyright © 2019 Frisco. All rights reserved.


import Foundation

class Character {
    var health: Int
    var energy: Int
    var attackDamage: Int
    var spellCasted: String
    
    init( health: Int, energy: Int, attackDamage: Int, spellCasted: String) {
        self.health = health
        self.energy = energy
        self.attackDamage = attackDamage
        self.spellCasted = spellCasted
    }
    
}

class Hero: Character {
    var spells: [String] = ["Fire", "Water", "Earth", "Healing"]
    
    init(health: Int, energy: Int) {
        let num = Int.random(in: 1...4)
        
        super.init(health: 100, energy: 100, attackDamage: 10, spellCasted:spells[num])
        
    }
}

class Enemy: Character {
    
    var spells: [String] = ["Fire", "Death", "Poison", "Ice"]
    
    init(health: Int, energy: Int) {
        let num = Int.random(in: 1...4)
        
        super.init(health: 100, energy: 100, attackDamage: 10, spellCasted: spells[num])
        
        }
    
    
    }


