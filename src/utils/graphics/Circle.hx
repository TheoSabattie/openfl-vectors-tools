package utils.graphics;

import openfl.display.Sprite;

/**
 * ...
 * @author Théo Sabattié
 */
class Circle extends Sprite
{
    public var radius(default, set):Float;
    private var color:Int;
    
    public function new(radius:Float, color:Int = 0) 
    {
        super();
		this.radius = radius;
        this.color  = color;
    }
    
    private function set_radius(radius:Float):Float {
        this.radius = radius;
        updateGraphics();
        return radius;
    }
    
    private function updateGraphics():Void {
        graphics.clear();
        graphics.beginFill(color);
        graphics.drawCircle(0, 0, radius);
        graphics.endFill(); 
    }
}