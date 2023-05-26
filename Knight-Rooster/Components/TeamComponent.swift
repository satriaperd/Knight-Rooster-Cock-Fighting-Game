//
//  TeamComponent.swift
//  Knight-Rooster
//
//  Created by Satria Perdana on 26/05/23.
//

import SpriteKit
import GameplayKit

enum Team: Int {
    case team1 = 0
    case team2 = 1
    
    static let allValues = [team1, team2]
    
    func oppositeTeam() -> Team {
        switch self {
        case .team1:
            return .team2
        case .team2:
            return .team1
        }
    }
}

class TeamComponent: GKComponent {
    let team: Team
    
    init(team: Team) {
        self.team = team
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
