package utils.math;

/**
 * ...
 * @author Théo Sabattié
 */
class MathTools
{
    private static var RADIAN_TO_DEGREE:Float = 180 / Math.PI;
    private static var DEGREE_TO_RADIAN:Float = Math.PI / 180;
    
    public static function valueIsBetween(pValue:Float, pMinValue:Float, pMaxValue:Float):Bool {
		if (pMinValue <= pValue && pValue <= pMaxValue) {
			return true;
		} else {
			return false;
		}
	}    
    
    public static function radianToDegree(radian:Float):Float {
        return RADIAN_TO_DEGREE * radian;
    }
    
    public static function degreeToRadian(degree:Float):Float {
        return DEGREE_TO_RADIAN * degree;
    }
}