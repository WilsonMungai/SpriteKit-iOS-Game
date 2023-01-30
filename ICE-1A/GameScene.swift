import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    
    // Instance varaibles
    var ocean1: Ocean?
    var ocean2 : Ocean?
    var player : Player?
    var island: Island?
    
    override func sceneDidLoad() {
        name = "Game"
        
        // add the ocean to the scene
        ocean1 = Ocean()
        ocean1?.Start()
        ocean1?.Reset()
        addChild(ocean1!)
        
        ocean2 = Ocean()
        ocean2?.Start()
        ocean2?.position.y = -627
        addChild(ocean2!)
        
        // add the plane to the game scene
        player = Player()
        addChild(player!)
        
        // add the island to the game scene
        island = Island()
        addChild(island!)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    // Gets triggered every frame(approx 60 frames per second/ once every 16 ms)
    override func update(_ currentTime: TimeInterval) {
        
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
        island?.Update()
    }
    
}
