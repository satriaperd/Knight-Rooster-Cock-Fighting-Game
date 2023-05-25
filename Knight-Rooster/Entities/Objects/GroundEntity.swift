//
//  GroundEntity.swift
//  Knight Rooster : Cock Fighting Game
//
//  Created by Satria Perdana on 25/05/23.
//

import SpriteKit
import GameplayKit
import Foundation

class GroundEntity: GKEntity {
    init(imageNamed: String) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageNamed))
        addComponent(spriteComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
