package objects;

import components.MapRendererComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
    Represents a single layer of the map.
**/
class MapLayer extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        super(layer);

        addComponent(new MapRendererComponent());
    }
}