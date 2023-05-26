//
//  HealthbarComponent.swift
//  Knight-Rooster
//
//  Created by Satria Perdana on 26/05/23.
//

import SpriteKit
import GameplayKit

class HealtbarComponent: GKComponent {
    let fullHealth: CGFloat
    var health: CGFloat
    let fullwidthHealth: CGFloat
    let healthbar: SKShapeNode
    let entityManager: EntityManager
    
    init(parentNode: SKNode, barWidth: CGFloat, health:CGFloat, entityManager: EntityManager, xPosition: CGFloat, yPosition: CGFloat){
        self.fullHealth = health
        self.health = health
        self.entityManager = entityManager
        
        fullwidthHealth = barWidth
        
        healthbar = SKShapeNode(rectOf: CGSize(width: fullwidthHealth, height: 24), cornerRadius: 4)
        healthbar.fillColor = .green
        healthbar.strokeColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
        healthbar.position = CGPoint(x: xPosition / 2, y: yPosition / 2)
        parentNode.addChild(healthbar)
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult func takeDamage(_ damage: CGFloat) -> Bool{
        health = max(health - damage, 0)
        
        healthbar.isHidden = false
        let healthScale = health/fullHealth
        let scaleAction = SKAction.scaleX(to: healthScale, y: 0, duration: 0.5)
        healthbar.run(SKAction.group([scaleAction]))
        
        if health == 0 {
            if let entity = entity {
                let roosterEntity = entity.component(ofType: SpriteComponent.self)
                if roosterEntity == nil {
                    entityManager.removeEntity(entity)
                }
            }
        }
        
        return health == 0
    }
}
