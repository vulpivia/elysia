package objects;

import components.PanelComponent;
import components.TextComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;

class InfoWindow extends GameObject
{
    static inline var PADDING:Int = 4;

    public function new(layer:FlxTypedGroup<FlxObject>, size:FlxPoint, text:String)
    {
        super(layer);

        var panel = new PanelComponent(PADDING);
        panel.size = size;
        addComponent(panel);
        addComponent(new TextComponent(text));
    }
}