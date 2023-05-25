//
//  FightingScene.swift
//  Knight Rooster : Cock Fighting Game
//
//  Created by Satria Perdana on 25/05/23.
//

import GameplayKit
import SpriteKit
import Foundation

class FightingScene: SKScene {
    var entityManager: EntityManager!
    
    // MARK: DID MOVE
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        entityManager = EntityManager(scene: self)
        
        let ground = GroundEntity(imageNamed: "ground")
        let background = BackgroundEntity(imageNamed: "background")
        let playerRooster = RoosterEntity(imageNamed: "rooster/rooster-1/rooster")
        let aiRooster = RoosterEntity(imageNamed: "rooster/rooster-2/rooster")
        
        // MARK: Configure Entity
        
        // Player Rooster
        if let playerRoosterComponent = playerRooster.component(ofType: SpriteComponent.self) {
            let rooster = playerRoosterComponent.node
            let roosterSize = rooster.size
            let xPosition = -frame.width / 2 + roosterSize.width * 2
            
            rooster.position = CGPoint(x: xPosition, y: roosterSize.height / 2)
            rooster.zPosition = 1
            rooster.xScale = 1
            
            rooster.physicsBody = SKPhysicsBody(rectangleOf: roosterSize)
            rooster.physicsBody?.affectedByGravity = true
            rooster.physicsBody?.isDynamic = true
            rooster.physicsBody?.pinned = false
            rooster.physicsBody?.allowsRotation = false
        }
        
        // AI Rooster
        if let aiRoosterComponent = aiRooster.component(ofType: SpriteComponent.self) {
            let rooster = aiRoosterComponent.node
            let roosterSize = rooster.size
            let xPosition = frame.width / 2 - roosterSize.width * 2
            
            rooster.position = CGPoint(x: xPosition, y: roosterSize.height / 2)
            rooster.zPosition = 1
            rooster.xScale = -1
            
            rooster.physicsBody = SKPhysicsBody(rectangleOf: roosterSize)
            rooster.physicsBody?.affectedByGravity = true
            rooster.physicsBody?.isDynamic = true
            rooster.physicsBody?.pinned = false
            rooster.physicsBody?.allowsRotation = false
        }
        
        //Ground
        if let groundComponent = ground.component(ofType: SpriteComponent.self) {
            let groundYPosition = -frame.height / 2 + groundComponent.node.size.height / 2
            let groundSize = groundComponent.node.size
            
            groundComponent.node.position = CGPoint(x: 0, y: groundYPosition)
            groundComponent.node.zPosition = 1
            
            groundComponent.node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: groundSize.width, height: groundSize.height))
            groundComponent.node.physicsBody?.isDynamic = false
            groundComponent.node.physicsBody?.affectedByGravity = false
            groundComponent.node.physicsBody?.allowsRotation = false
            
        }
        
        // Background
        if let backgroundComponent = background.component(ofType: SpriteComponent.self) {
            backgroundComponent.node.position = CGPoint(x: 0, y: 0)
            backgroundComponent.node.zPosition = -10
        }
        
        // Add Component to scene
        entityManager.addEntity(playerRooster)
        entityManager.addEntity(aiRooster)
        entityManager.addEntity(ground)
        entityManager.addEntity(background)
        
        // Gravity
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
    }
}
