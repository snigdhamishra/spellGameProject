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

    
    @IBAction func spell1(_ sender: UIButton) {
        turn = false
        if (dead == true)
        {
            sender.isEnabled = false
        }
        else if (player.energy >= 10)
        {
            enemy.health -= 20
            player.energy -= 10
            effect.image = UIImage(named: "earth")
            playerTurn.text = "The player attacked the enemy for 10 damage!"
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
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
        if (enemy.health <= 0)
        {
            
        }
        enemyTurn()
    }
    @IBAction func spell2(_ sender: UIButton) {
        turn = false
        var damage = Int.random(in: 1...50)
        if (dead == true)
        {
            sender.isEnabled = false
        }
        else if (player.energy >= 30)
        {
            enemy.health -= damage
            player.energy -= 30
            if (player.energy < 0)
            {
                player.energy = 0
            }
            effect.image = UIImage(named: "water")
            playerTurn.text = "The player attacked the enemy for \(damage) damage!"
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
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
        enemyTurn()
    }
    @IBAction func spell3(_ sender: UIButton) {
        turn = false
        var damage = Int.random(in: 1...200)
        if (dead == true)
        {
            sender.isEnabled = false
        }
        else if (player.energy >= 100)
        {
            enemy.health -= damage
            player.energy -= 100
            if (player.energy < 0)
            {
                player.energy = 0
            }
            effect.image = UIImage(named: "alphacChadMove")
        playerTurn.text = "The player attacked the enemy for \(damage) damage!"
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
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
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
            player.health += 30
            player.energy -= 30
            if (player.energy < 0)
            {
                player.energy = 0
            }
            effect.image = UIImage(named: "healing")
        playerTurn.text = "The player healed 10 health!"
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
            if (enemy.energy >= 50)
            {
                player.health -= 50
                enemy.energy -= 100
                turnDescription.text = "Enemy used pain split!"
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
                turnDescription.text = "Enemy healed 30 health!"
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
        regen()
        playerHealth.text = "\(player.health)"
        playerEnergy.text = "\(player.energy)"
        enemyHealth.text = "\(enemy.health)"
        enemyEnergy.text = "\(enemy.energy)"
        turn = true
    }
    func superEnemy()
    {
        wonCounter += 1
        enemy.health += 150 * wonCounter
        enemy.energy += wonCounter * 150
        player.health += 50
        player.energy += 150
        turnDescription.text = "Enemy #\(wonCounter) has been slain. Enemy #\(wonCounter += 1) has appeared"
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
