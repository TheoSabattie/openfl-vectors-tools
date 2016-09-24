package;

import haxe.ds.Vector;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import utils.graphics.Circle;
import utils.graphics.Line;
import utils.math.MathTools;
import utils.math.SegmentTools;
import utils.math.Vector2Tools;
import lime.math.Vector2;
import openfl.display.Graphics;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.display.StageDisplayState;

using utils.math.PointExtension;

/**
 * ...
 * @author Théo Sabattié
 */
class Main extends Sprite 
{

    private var lines:Array<Line> = [];
    
	public function new() 
	{
		super();
        centerToStage();
        
        //drawTwoVectorsAndTheirBouncedAndReflectedVectors();
        setupListenerToBuildVectorAndBounceReflectionOnClick();
	}
    
    private function setupListenerToBuildVectorAndBounceReflectionOnClick():Void {
        var baseLine:Line = drawLineAt(new Vector2( -500, 255), new Vector2(100, -250));
        
        var firstPoint:Vector2;
        
        stage.addEventListener(MouseEvent.CLICK, function (event:MouseEvent) {
            var position:Vector2 = globalToLocal(new Point(event.stageX, event.stageY)).toVector2();
            
            drawCircleAtPosition(position);
            
            if (firstPoint == null) {
                firstPoint = position;
            } else {
                var line:Line = drawLineAt(position.subtract(firstPoint), firstPoint, 0xFF0F0F);
                
                firstPoint = null;
                
                var intersection:Vector2 = SegmentTools.getIntersection(baseLine, line);
                
                if (intersection != null) {
                    drawCircleAtPosition(intersection);
                    
                    var length:Float            = line.getEndPoint().subtract(intersection).length;
                    var bouncedVector:Vector2   = Vector2Tools.bouncedVector(baseLine.getVector(), line.getVector());
                    var reflectedVector:Vector2 = Vector2Tools.reflectedVector(baseLine.getVector(), line.getVector());
                    
                    bouncedVector.normalize(length);
                    reflectedVector.normalize(length);
                    
                    drawLineAt(bouncedVector, intersection, 0x00FF00);
                    drawLineAt(reflectedVector, intersection, 0x0000FF);
                }
            }
        }); 
        
        var textFormat:TextFormat = new TextFormat("Candara", 40);
        textFormat.align          = TextFormatAlign.CENTER;
        
        var text:TextField = new TextField();
        text.htmlText = "Two clicks to draw a line ! When your line intersect black line, it draws bounce and reflexion\n" +
            "red : your line, black : baseLine, green : bounced, blue : reflexion";
        
        text.defaultTextFormat = textFormat;
        
        text.selectable = false;
        text.autoSize = TextFieldAutoSize.CENTER;
        
        addChild(text);
        text.y = stage.stageHeight / 2 - text.height;
    }
    
    private function drawLineAt(lineVector:Vector2, position:Vector2, ?color = 0):Line {
        var line:Line = new Line(lineVector, color);
        line.x        = position.x;
        line.y        = position.y;
        
        addChild(line);
        
        return line;
    }
    
    private function drawCircleAtPosition(position:Vector2, radius = 3):Circle {
        var circle:Circle  = new Circle(radius);
        circle.x           = position.x;
        circle.y           = position.y;
        
        addChild(circle); 
        
        return circle;
    }
    
    private function centerToStage() {
        var center:Vector2 = new Vector2(stage.stageWidth / 2, stage.stageHeight / 2);
        x = center.x;
        y = center.y; 
    }
    
    private function drawTwoVectorsAndTheirBouncedAndReflectedVectors() {
        var blackBaseLine:Line    = new Line(new Vector2(45, 50));
        var greyLine:Line         = new Line(new Vector2(55, -100), 0x888888);
        var redReflectedLine:Line = new Line(Vector2Tools.reflectedVector(blackBaseLine.getVector(), greyLine.getVector()), 0xFF0000);
        var greenBouncedLine:Line = new Line(Vector2Tools.bouncedVector(blackBaseLine.getVector(), greyLine.getVector()), 0x00FF00);
        
        addChild(blackBaseLine);
        addChild(greyLine);
        addChild(redReflectedLine);
        addChild(greenBouncedLine);
        
        trace(Vector2Tools.angleBetweenVectors(redReflectedLine.getVector(), greyLine.getVector()));
        
        // Note for understanding:
        // all vectors start from center
    }
}
