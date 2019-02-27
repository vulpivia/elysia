package objects;

import components.PanelComponent;
import components.TextComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.text.FlxText;

/**
    Show a non-interactable window to display additional information.
**/
class InfoWindow extends GameObject
{
    /**
        Padding between the window border and the text.
    **/
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