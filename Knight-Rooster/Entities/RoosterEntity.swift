//
//  RoosterEntity.swift
//  Knight Rooster : Cock Fighting Game
//
//  Created by Satria Perdana on 25/05/23.
//

import GameplayKit
import SpriteKit
import Foundation

class RoosterEntity: GKEntity {
    init(imageNamed: String, team: Team) {
        addComponent(TeamComponent(team: team))
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageNamed))
        addComponent(spriteComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
