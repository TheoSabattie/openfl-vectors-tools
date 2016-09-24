package utils.graphics;

import utils.math.ISegment;
import utils.math.Segment;
import lime.math.Vector2;
import openfl.display.Sprite;

/**
 * ...
 * @author Théo Sabattié
 */
class Line extends Sprite implements ISegment
{
    private var vector:Vector2;
    private var color:Int;
    
    public function new(vector:Vector2, color:Int = 0) 
    {
        super();
        this.color = color;
        setVector(vector);
    }
    
    private function updateGraphics() {
        graphics.clear();
        graphics.lineStyle(2, color, 1);
        graphics.beginFill();
        graphics.moveTo(0, 0); 
        graphics.lineTo(vector.x, vector.y);
        graphics.endFill();
    }
    
    public function getStartPoint():Vector2 {
        return new Vector2(x, y);
    }
    
    public function getEndPoint():Vector2 {
        return new Vector2(x + vector.x, y + vector.y);
    }
    
    public function getVector():Vector2 {
        return vector.clone();
    }
    
    public function setVector(vector:Vector2):Void {
        this.vector = vector;
        updateGraphics();
    }
}