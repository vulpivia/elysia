package objects;

import components.OptionListComponent;
import components.PanelComponent;
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
}