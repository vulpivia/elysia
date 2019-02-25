package objects;

import components.PanelComponent;
import components.TextComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.text.FlxText;

class InfoWindow extends GameObject
{
    public static inline var PADDING:Int = 8;

    public function new(layer:FlxTypedGroup<FlxObject>, size:FlxPoint, text:String, alignment:FlxTextAlign = FlxTextAlign.LEFT)
    {
        super(layer);

        var panel = new PanelComponent();
        panel.size = size;
        addComponent(panel);
        addComponent(new TextComponent(text, PADDING, alignment));
    }
}