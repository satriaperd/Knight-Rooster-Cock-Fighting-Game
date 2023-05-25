//
//  EntityManager.swift
//  Knight Rooster : Cock Fighting Game
//
//  Created by Satria Perdana on 25/05/23.
//

import GameplayKit
import SpriteKit
import Foundation

class EntityManager {
    var entities = Set<GKEntity>()
    let scene: SKScene
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func addEntity(_ entity: GKEntity){
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        
    }
    
    func removeEntity(_ entity: GKEntity) {
        if (entity.component(ofType: SpriteComponent.self)?.node) != nil {
            scene.removeFromParent()
        }
        
        entities.remove(entity)
    }
}
