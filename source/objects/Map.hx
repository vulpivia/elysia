package objects;

import components.MapRendererComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;

class Map extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        super(layer);

        addComponent(new MapRendererComponent());
    }
}