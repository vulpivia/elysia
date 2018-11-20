package states;

import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSort;
import flixel.FlxObject;

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
        Game.createObjects(this);

        add(backgroundLayer);
        add(middleLayer);
        add(foregroundLayer);
        add(uiLayer);

        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        Game.update();

        middleLayer.sort(FlxSort.byY);
    }
}