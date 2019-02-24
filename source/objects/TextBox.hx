package objects;

import components.DynamicTextComponent;
import components.PanelComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;

/**
    A textbox containing some text. Used for dialogue by characters that aren't present.
**/
class TextBox extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>, size:FlxPoint, text:String, length:Int, callback:Void->Void)
    {
        super(layer);

        var panel = new PanelComponent(4);
        panel.size = size;
        addComponent(panel);
        addComponent(new DynamicTextComponent(text, length, callback));
    }
}