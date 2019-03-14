package objects;

import components.OptionListComponent;
import components.PanelComponent;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
    A window containing multiple options to choose from.
**/
class OptionWindow extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        super(layer);

        addComponent(new PanelComponent());
        addComponent(new OptionListComponent());
    }

    override public function start()
    {
        position.x += FlxG.camera.scroll.x;
        position.y += FlxG.camera.scroll.y;
        super.start();
    }
}