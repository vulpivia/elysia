package objects;

import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;

class Map extends GameObject
{
    public function new(backgroundLayer:FlxTypedGroup<FlxObject>, foregroundLayer:FlxTypedGroup<FlxObject>)
    {
        super(layer);
    }
}