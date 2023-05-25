//
//  BackgroundEntity.swift
//  Knight-Rooster
//
//  Created by Satria Perdana on 26/05/23.
//

import SpriteKit
import GameplayKit
import Foundation

class BackgroundEntity: GKEntity {
    init(imageNamed: String) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageNamed))
        addComponent(spriteComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
