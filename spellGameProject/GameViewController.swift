//
//  GameViewController.swift
//  spellGameProject
//
//  Created by Mishra, Snigdha on 12/5/19.
//  Copyright © 2019 Frisco. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    @IBOutlet var effect: UIImageView!
    @IBOutlet var playerHealth: UILabel!
    @IBOutlet var playerEnergy: UILabel!
    @IBOutlet var turnDescription: UILabel!
    @IBOutlet var enemyHealth: UILabel!
    @IBOutlet var enemyEnergy: UILabel!
    var turn = true
    var enemy = Enemy(health: 100, energy: 100)
    var player = Hero(health: 100, energy: 100)
    override func viewDidLoad() {
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    
    @IBAction func spell1(_ sender: Any) {
        turn = false
        if (player.energy > 0)
        {
            enemy.health -= 10
            player.energy -= 30
            if (player.energy < 0)
            {
                player.energy = 0
            }
            effect.image = UIImage(named: "earth")
        }
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
        enemyTurn()
    }
    @IBAction func spell2(_ sender: Any) {
        turn = false
        var damage = Int.random(in: 1...20)
        if (player.energy >= 20)
        {
            enemy.health -= damage
            player.energy -= 15
            if (player.energy < 0)
            {
                player.energy = 0
            }
            effect.image = UIImage(named: "water")
        }
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
        enemyTurn()
    }
    @IBAction func spell3(_ sender: Any) {
        turn = false
        var damage = Int.random(in: 1...100)
        if (player.energy == 100)
        {
            enemy.health -= damage
            player.energy -= 100
            if (player.energy < 0)
            {
                player.energy = 0
            }
            effect.image = UIImage(named: "alphacChadMove")
        }
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
        enemyTurn()
    }
    @IBAction func spell4(_ sender: Any) {
        turn = false
        if (player.energy > 0)
        {
            player.health += 10
            player.energy -= 20
            if (player.energy < 0)
            {
                player.energy = 0
            }
            effect.image = UIImage(named: "healing")
        }
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
        enemyTurn()
    }
    func enemyTurn()
    {
        let num = Int.random(in: 1...4)
        if (num == 1)
        {
            player.health -= 10
            enemy.energy -= 30
        }
        else if (num == 2)
        {
            player.health -= 30
            enemy.energy -= 60
        }
        else if (num == 3)
        {
            enemy.health = (enemy.health + player.health)/2
            player.health = enemy.health
            enemy.energy -= 50
        }
        else if (num == 4)
        {
            enemy.health += 30
            enemy.energy -= 50
        }
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
        turn = true
    }
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
