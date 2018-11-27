package objects;

import components.BubbleComponent;
import components.DynamicTextComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;

class TextBubble extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        super(layer);

        addComponent(new BubbleComponent());
        addComponent(new DynamicTextComponent());
    }
}