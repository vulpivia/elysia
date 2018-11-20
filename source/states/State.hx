package states;

import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSort;

/**
    The base class for game states.
**/
class State extends FlxState
{
    var backgroundLayer:FlxTypedGroup<FlxObject>;
    var foregroundLayer:FlxTypedGroup<FlxObject>;
    var spriteLayer:FlxTypedGroup<FlxObject>;
    var uiLayer:FlxTypedGroup<FlxObject>;

    function new()
    {
        super();

        backgroundLayer = new FlxTypedGroup<FlxObject>();
        foregroundLayer = new FlxTypedGroup<FlxObject>();
        spriteLayer = new FlxTypedGroup<FlxObject>();
        uiLayer = new FlxTypedGroup<FlxObject>();
    }

    override public function create()
    {
        add(backgroundLayer);
        add(spriteLayer);
        add(foregroundLayer);
        add(uiLayer);
    }

    override public function update(elapsed:Float)
    {
        spriteLayer.sort(FlxSort.byY);
    }
}