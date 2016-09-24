package utils.math;
import utils.math.ISegment;
import lime.math.Vector2;

/**
 * ...
 * @author Théo Sabattié
 */
class SegmentTools
{
    /**
     * Return point of intersection or null if there is not intersection
     * @param segmentA
     * @param segmentB
     * @return
     */
    public static function getIntersection(segmentA:ISegment, segmentB:ISegment):Vector2 {
            var pPointA:Vector2 = segmentA.getStartPoint();
            var pPointB:Vector2 = segmentA.getEndPoint();
            var pPointC:Vector2 = segmentB.getStartPoint();
            var pPointD:Vector2 = segmentB.getEndPoint();
            
            // Vecteur AB
			var xA:Float = pPointA.x;
			var yA:Float = pPointA.y;
			var xB:Float = pPointB.x;
			var yB:Float = pPointB.y;
			
			var xD1:Float = yA * 1 - 1 * yB; 
			var yD1:Float = 1 * xB - 1 * xA * 1; 
			var zD1:Float = xA * yB - yA * xB;
			
			
			// Vecteur CD
			var xC:Float = pPointC.x;
			var yC:Float = pPointC.y;
			var xD:Float = pPointD.x;
			var yD:Float = pPointD.y;
			
			var xD2:Float = yC * 1 - 1 * yD; 
			var yD2:Float = 1 * xD - 1 * xC * 1; 
			var zD2:Float = xC * yD - yC * xD;
			
			var xM:Float = yD1 * zD2 - zD1 * yD2;
			var yM:Float = zD1 * xD2 - xD1 * zD2;
			var zM:Float = xD1 * yD2 - yD1 * xD2;
			
			var lX:Float = xM/zM;
			var lY:Float = yM/zM;
			
			if (
                MathTools.valueIsBetween(lX, Math.min(pPointA.x, pPointB.x), Math.max(pPointA.x, pPointB.x)) 
                && MathTools.valueIsBetween(lX, Math.min(pPointC.x, pPointD.x), Math.max(pPointC.x, pPointD.x)) 
                && MathTools.valueIsBetween(lY, Math.min(pPointA.y, pPointB.y), Math.max(pPointA.y, pPointB.y)) 
                && MathTools.valueIsBetween(lY, Math.min(pPointC.y, pPointD.y), Math.max(pPointC.y, pPointD.y))
            )
			{
				return new Vector2(lX, lY);
			}
			
			return null;
		}
    
}