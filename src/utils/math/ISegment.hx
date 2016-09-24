package utils.math;
import lime.math.Vector2;

/**
 * ...
 * @author Théo Sabattié
 */
interface ISegment
{
    function getStartPoint():Vector2;
    function getEndPoint():Vector2;
    function getVector():Vector2;
}