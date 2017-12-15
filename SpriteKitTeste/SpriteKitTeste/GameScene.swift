//
//  GameScene.swift
//  SpriteKitTeste
//
//  Created by STEFAN VARGAS DE MORAES on 04/12/17.
//  Copyright © 2017 STEFAN VARGAS DE MORAES. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var label: SKLabelNode!
    var previoustime: TimeInterval = 0.0
    var firstTime = true
    var sprite: SKSpriteNode!
    var atlas: SKTextureAtlas!
    
    override func didMove(to view: SKView) {
        
        
        scaleMode = .aspectFit
        backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        
        size = CGSize (width: 720, height: 1280)
        // =)
        
        label = SKLabelNode(text:" Ticaricatica Manolo!")
        label.fontColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        label.position = CGPoint(x: size.width/2,y: 500)
        label.fontSize = 75
        label.zPosition = 1.1
        addChild(label)
        
        let subAction = SKAction.move(by: CGVector(dx: 0, dy: 60), duration: 1)
        let action = SKAction.repeatForever(subAction)
        label.run(action)
        
        atlas = SKTextureAtlas.init(named: "Imagens")

        let texture = SKTexture(imageNamed: "godLike")
        sprite = SKSpriteNode.init(texture: texture)
        addChild(sprite)
        
        //let sprite2 = SKSpriteNode(texture: atlas.textureNamed("andrezaoo"))
        
        sprite.position = label.position
        sprite.size = CGSize (width: 250, height: 250)
        
        let spriteList = [ atlas.textureNamed("andrezaoo"), atlas.textureNamed("godLike")]
        
        let spriteAction = SKAction.animate(with: spriteList, timePerFrame: 0.5)
        
        sprite.run(SKAction.repeatForever(spriteAction))
        
    }
    override func willMove(from view: SKView) {
        //Existe esse metodo =)
    }
        
    override func update(_ currentTime: TimeInterval) {
      /*  let deltaTime: CGFloat
        
        if firstTime {
            firstTime = false
            deltaTime = 1/60
        } else {
            deltaTime = CGFloat(currentTime - previoustime)
        }
        
        // Called before each frame is rendered
        
        previoustime = currentTime
        label.position.y += deltaTime*60
        print(1/deltaTime) */
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let pos = touch.location(in: self)
            
         
            var spriteInTouch2 = SKSpriteNode(texture: atlas.textureNamed("andrezaoo"))
            var spriteInTouch = SKSpriteNode(texture: atlas.textureNamed("ellen"))
            
            addChild(spriteInTouch)
            spriteInTouch.position = pos
            spriteInTouch.zPosition = 2
            
            let action =  SKAction.fadeOut(withDuration: 2)
            spriteInTouch.run(action,completion: { spriteInTouch.removeFromParent()})
            
            if nodes(at: pos).contains(sprite){
                spriteInTouch.color = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
                spriteInTouch.colorBlendFactor = 1
                
            } else {
                spriteInTouch = spriteInTouch2
                print("OBA!")
                //
            }
            
        }
        
        
    }
}
