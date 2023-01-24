import GameplayKit
import SpriteKit

class Player: GameObject {
    
    // MARK: Initializer
    init() {
        super.init(imageString: "plane", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Fatal Error")
    }
    
    // MARK: Life Cycle Functions
    
    override func Start()
    {
        zPosition = 2
        Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        // constrain the player on the left boundary
        if(position.x <= -320)
        {
            position.x = -320
        }
        
        // constrain the player on the right boundary
        if(position.x >= 320)
        {
            position.x = 320
        }
    }
    
    // Plane position 
    override func Reset()
    {
        position.y = -640
    }
    
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
}
