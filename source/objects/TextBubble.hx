package objects;

import components.BubbleComponent;
import components.DynamicTextComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;

/**
    A text bubble containing some text. Used for displaying character dialogue.
**/
class TextBubble extends GameObject
{
    static inline var PADDING:Int = 4;

    public function new(layer:FlxTypedGroup<FlxObject>, size:FlxPoint, text:String, length:Int, callback:Void->Void)
    {
        super(layer);

        var bubble = new BubbleComponent(PADDING);
        bubble.size = size;
        addComponent(bubble);
        addComponent(new DynamicTextComponent(text, length, callback));
    }
}