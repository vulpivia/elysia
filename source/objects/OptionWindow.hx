package objects;

import components.PanelComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;

class OptionWindow extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        super(layer);
        
        addComponent(new PanelComponent());
        addComponent(new OptionComponent());
    }
}