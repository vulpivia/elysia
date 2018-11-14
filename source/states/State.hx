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
    public var backgroundLayer:FlxTypedGroup<FlxObject>;
    public var middleLayer:FlxTypedGroup<FlxObject>;
    public var foregroundLayer:FlxTypedGroup<FlxObject>;
    public var uiLayer:FlxTypedGroup<FlxObject>;

    function new()
    {
        super();

        backgroundLayer = new FlxTypedGroup<FlxObject>();
        middleLayer = new FlxTypedGroup<FlxObject>();
        foregroundLayer = new FlxTypedGroup<FlxObject>();
        uiLayer = new FlxTypedGroup<FlxObject>();

        Game.clear();
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