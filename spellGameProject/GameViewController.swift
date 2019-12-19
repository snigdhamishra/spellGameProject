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
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var effect: UIImageView!
    @IBOutlet var playerHealth: UILabel!
    @IBOutlet var playerEnergy: UILabel!
    @IBOutlet var turnDescription: UILabel!
    @IBOutlet var playerTurn: UILabel!
    @IBOutlet var enemyHealth: UILabel!
    @IBOutlet var enemyEnergy: UILabel!
    var count = 0
    var turn = true
    var enemy = Character(health: 100, energy: 100)
    var player = Character(health: 100, energy: 100)
    var wonCounter = 0
    var justDefeated = false
    var dead = false
    override func viewDidLoad() {
        playerHealth.text = "\(player.health) Health"
        playerEnergy.text = "\(player.energy) Energy"
        enemyHealth.text = "\(enemy.health) Health"
        enemyEnergy.text = "\(enemy.energy) Energy"
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

    
    @IBAction func spell1(_ sender: UIButton) {
        turn = false
        if (dead == true)
        {
            sender.isEnabled = false
        }
        else if (player.energy >= 10)
        {
            enemy.health -= 20 + 20 * wonCounter
            player.energy -= 10
            effect.image = UIImage(named: "earth")
            playerTurn.text = "The player attacked the enemy for \(20 + 10 * wonCounter) damage!"
            if (enemy.health <= 0)
            {
                superEnemy()
                
            }
        }
        else
        {
            playerTurn.text = "The player tried to attack the enemy but failed!"
        }
        if (player.energy <= 0)
        {
            player.energy = 0
        }
        
        if (enemy.health <= 0)
        {
            
        }
        enemyTurn()
    }
    @IBAction func spell2(_ sender: UIButton) {
        turn = false
        let damage = Int.random(in: 1...50)
        if (dead == true)
        {
            sender.isEnabled = false
        }
        else if (player.energy >= 30)
        {
            enemy.health -= damage + damage/2 * wonCounter
            player.energy -= 30
            if (player.energy < 0)
            {
                player.energy = 0
            }
            effect.image = UIImage(named: "water")
            playerTurn.text = "The player attacked the enemy for \(damage + damage/2 * wonCounter) damage!"
            if (enemy.health <= 0)
            {
                superEnemy()
            }
        }
        else
        {
            playerTurn.text = "The player tried to attack the enemy but failed!"
        }
        if (player.energy <= 0)
        {
            player.energy = 0
        }
       
        enemyTurn()
    }
    @IBAction func spell3(_ sender: UIButton) {
        turn = false
        let damage = Int.random(in: 1...200)
        if (dead == true)
        {
            sender.isEnabled = false
        }
        else if (player.energy >= 100)
        {
            enemy.health -= damage + damage/2 * wonCounter
            player.energy = 0
            if (player.energy < 0)
            {
                player.energy = 0
            }
            effect.image = UIImage(named: "alphacChadMove")
        playerTurn.text = "The player attacked the enemy for \(damage + damage/2 * wonCounter) damage!"
            if (enemy.health <= 0)
            {
                superEnemy()
            }
        }
        else
        {
            playerTurn.text = "The player tried to attack the enemy but failed!"
        }
        if (player.energy <= 0)
        {
            player.energy = 0
        }
        
        enemyTurn()
    }
    @IBAction func spell4(_ sender: UIButton) {
        turn = false
        if (dead == true)
        {
            sender.isEnabled = false
        }
        else if (player.energy > 0)
        {
            player.health += 30 + 30 * wonCounter
            player.energy -= 30
            if (player.energy < 0)
            {
                player.energy = 0
            }
            effect.image = UIImage(named: "healing")
        playerTurn.text = "The player healed \(30 + 30 * wonCounter) health!"
            if (enemy.health <= 0)
            {
                superEnemy()
            }
            }
        else
        {
            playerTurn.text = "The player tried to heal but failed!"
        }
            if (player.energy <= 0)
            {
                player.energy = 0
            }
        
        enemyTurn()
    }
    func enemyTurn()
    {
        let num = Int.random(in: 1...4)
        if (num == 1)
        {
            if (enemy.energy >= 30)
            {
                player.health -= 10
                enemy.energy -= 30
                turnDescription.text = "The enemy attacked the player for 10 damage!"
            }
            else
            {
                turnDescription.text = "The enemy tried to atack the player but failed!"
            }
            if (enemy.energy <= 0)
            {
                enemy.energy = 0
            }
        }
        else if (num == 2)
        {
            if (enemy.energy >= 30)
            {
                player.health -= 30
                enemy.energy -= 60
                turnDescription.text = "The enemy attacked the player for 30 damage!"
            }
            else
            {
                turnDescription.text = "The enemy tried to atack the player but failed!"
            }
            if (enemy.energy <= 0)
            {
                enemy.energy = 0
            }
        }
        else if (num == 3)
        {
            if (enemy.energy >= 1)
            {
                player.health -= enemy.energy/5
                let dam = enemy.energy/5
                enemy.energy = 0
                turnDescription.text = "The enemy attacked the player for \(dam) damage!"
            }
            else
            {
                turnDescription.text = "The enemy tried to atack the player but failed!"
            }
            if (enemy.energy <= 0)
            {
                enemy.energy = 0
            }
        }
        else if (num == 4)
        {
            if (enemy.energy >= 40)
            {
                
                enemy.health += 10
                enemy.energy -= 50
                turnDescription.text = "Enemy healed 10 health!"
            }
                else
                {
                    turnDescription.text = "The enemy tried to heal but failed!"
                }
                if (enemy.energy <= 0)
                {
                    enemy.energy = 0
                }
        }
        if (player.health <= 0)
        {
            player.health = 0
            playerDead()
        }
        
        playerHealth.text = "\(player.health) Health"
        playerEnergy.text = "\(player.energy) Energy"
        enemyHealth.text = "\(enemy.health) Health"
        enemyEnergy.text = "\(enemy.energy) Energy"
        regen()
        turn = true
        
    }
    func superEnemy()
    {
        wonCounter += 1
        enemy.health += 150 * wonCounter
        enemy.energy += wonCounter * 150
        player.health += 50
        player.energy += 150
        playerTurn.text = "Enemy #\(wonCounter) has been slain. A new one appeared!"
        justDefeated = true
    }
    func regen() {
        player.energy += 10 + (10 * wonCounter)
        enemy.energy += 10 + (10 * wonCounter)
    }
    func playerDead()
    {
        playerTurn.text = ""
        player.energy = 0
        turnDescription.text = "Game Over"
        playerTurn.text = "Number of enemies defeated: \(wonCounter)"
        playerImage.image = UIImage(named: "download")
        dead = true
        
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
