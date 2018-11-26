package objects;

import components.BubbleComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;

class TextBubble extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        super(layer);

        addComponent(new BubbleComponent());
    }
}