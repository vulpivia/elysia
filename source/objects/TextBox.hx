package objects;

import components.DynamicTextComponent;
import components.PanelComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;

class TextBox extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>, size:FlxPoint, text:String, length:Int, callback:Void->Void)
    {
        super(layer);

        var panel = new PanelComponent();
        panel.size = size;
        addComponent(panel);
        addComponent(new DynamicTextComponent(text, length, callback));
    }
}