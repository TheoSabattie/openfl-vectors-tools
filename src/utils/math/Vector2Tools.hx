package utils.math;
import lime.math.Vector2;

/**
 * ...
 * @author Théo Sabattié
 */
class Vector2Tools
{
    public static function projectedVector(vectorToProject:Vector2, vectorTarget:Vector2):Vector2 {
        var radian:Float            = radianBetweenVectors(vectorToProject, vectorTarget);
        var vectorLength:Float      = Math.cos(radian) * vectorToProject.length;
        var projectedVector:Vector2 = vectorTarget.clone();
        
        projectedVector.normalize(vectorLength);
        
        return projectedVector;
    }
    
    public static function bouncedVector(vectorMirror:Vector2, vectorToBounce:Vector2):Vector2 {
        var projectedVector:Vector2 = Vector2Tools.projectedVector(vectorToBounce, vectorMirror);
        var helperVector:Vector2    = projectedVector.subtract(vectorToBounce);
        var lX:Float                = helperVector.x + projectedVector.x;
        var lY:Float                = helperVector.y + projectedVector.y;
        
        return new Vector2(lX, lY);
    }
    
    public static function reflectedVector(vectorMirror:Vector2, vectorToReflect:Vector2):Vector2 {
        var reflectedVector:Vector2 = bouncedVector(vectorMirror, vectorToReflect);
        
        return new Vector2( -reflectedVector.x, -reflectedVector.y);
    }
    
    public static function scalar(vectorA:Vector2, vectorB:Vector2):Float {
        return vectorA.length * vectorB.length * Math.cos(radianBetweenVectors(vectorA, vectorB));
    }
    
    public static function angleBetweenVectors(vectorA:Vector2, vectorB:Vector2):Float {
        return MathTools.radianToDegree(radianBetweenVectors(vectorA, vectorB));
    }
    
    public static function radianBetweenVectors(vectorA:Vector2, vectorB:Vector2):Float {
        return Math.abs(radianOfVectorFromHorizontalAxis(vectorA) - radianOfVectorFromHorizontalAxis(vectorB));
    }
    
    public static function radianOfVectorFromHorizontalAxis(vector:Vector2):Float {
        var lVector:Vector2 = vector.clone();
        lVector.normalize(1);
        
        var cos:Float = lVector.x;
        var sin:Float = lVector.y;
        
        return Math.atan2(sin, cos);
    }
    
    public static function degreeOfVectorFromHorizontalAxis(vector:Vector2):Float {
        return MathTools.radianToDegree(radianOfVectorFromHorizontalAxis(vector));
    }
}