//
//  GameScene.swift
//  misslecommand
//
//  Created by  on 12/20/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var missile = SKSpriteNode()
    var num = 0.0
    var touchedBefore = false
    
    
    override func didMove(to view: SKView) {
        //add border around the scene
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
//        let yellowBox = CGRect(x: 0, y: 0, width: 40, height: 40)
//        let touchPoint = touch.location(in: bubbleNode)
//        if yellowBox.contains(touch) {
//           print("Yellow box is touched!")
//        }
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        armada()
        
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        let location = touches.first!.location(in: self)
        
//        if !touchedBefore {
//            touchedBefore = true
            let missile = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 100, height: 100))
            addChild(missile)
        missile.move(location)

//        }
//        else {
//                // do your touch handling for other times
//            }
//
    }
    func createMissile()
    {
        let missile2 = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 100, height: 100))
    }
    
    
    func armada()
    {
        let wait = SKAction.wait(forDuration: 0.5)
        let sequence = SKAction.sequence([wait, SKAction.run(createShip)])
        run(SKAction.repeatForever(sequence))
    }
     
    func createShip()
    {
        let randx = Double.random(in: 0...1)
        let possibledx = [75, 100, -75, -100]
        let randdx =  possibledx.randomElement()!
        
        let ship = SKSpriteNode(color: UIColor.white, size: CGSize(width: 100, height: 100))
        ship.position = CGPoint(x: frame.width * randx, y: frame.height - 100)
        addChild(ship)
        ship.physicsBody = SKPhysicsBody(rectangleOf: ship.frame.size)
        ship.physicsBody?.applyImpulse(CGVector(dx: randdx, dy: 300))
        
    }
    
    
}

