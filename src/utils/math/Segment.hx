package utils.math;
import utils.math.ISegment;
import lime.math.Vector2;

/**
 * ...
 * @author Théo Sabattié
 */
class Segment implements ISegment
{
    private var startPoint:Vector2;
    private var endPoint:Vector2;
    
    public function new(startPoint:Vector2, endPoint:Vector2) 
    {
        this.startPoint = startPoint;
        this.endPoint   = endPoint;
    }
    
    public function getStartPoint():Vector2 {
       return startPoint.clone(); 
    }
    
    public function getEndPoint():Vector2 {
       return endPoint.clone(); 
    }
    
    public function getVector():Vector2 {
        return endPoint.subtract(startPoint);
    }
}