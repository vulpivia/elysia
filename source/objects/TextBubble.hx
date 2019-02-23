package objects;

import components.BubbleComponent;
import components.DynamicTextComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;

class TextBubble extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>, size:FlxPoint, text:String, length:Int, callback:Void->Void)
    {
        super(layer);

        addComponent(new BubbleComponent(size));
        addComponent(new DynamicTextComponent(text, length, callback));
    }
}