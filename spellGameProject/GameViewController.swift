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
        if (player.energy > 0)
        {
            enemy.health -= 10
            player.energy -= 30
        }
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
    }
    @IBAction func spell2(_ sender: Any) {
        var damage = Int.random(in: 1...20)
        if (player.energy >= 20)
        {
            enemy.health -= damage
            player.energy -= 15
        }
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
    }
    @IBAction func spell3(_ sender: Any) {
        var damage = Int.random(in: 1...100)
        if (player.energy == 100)
        {
            enemy.health -= damage
            player.energy -= 100
        }
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
    }
    @IBAction func spell4(_ sender: Any) {
        if (player.energy > 0)
        {
            player.health += 10
            player.energy -= 20
        }
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
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
