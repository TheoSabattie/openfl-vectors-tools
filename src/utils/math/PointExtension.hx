package utils.math;
import lime.math.Vector2;
import openfl.geom.Point;

/**
 * ...
 * @author Théo Sabattié
 */
class PointExtension
{

    public static function toVector2(point:Point):Vector2 
    {
        return new Vector2(point.x, point.y);
    }
    
}