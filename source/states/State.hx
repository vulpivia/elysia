package states;

import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSort;
import objects.GameObject;

/**
    The base class for game states.
**/
class State extends FlxState
{
    public static var current:State;

    public var gameObjects:Array<GameObject>;

    var backgroundLayer:FlxTypedGroup<FlxObject>;
    var foregroundLayer:FlxTypedGroup<FlxObject>;
    var spriteLayer:FlxTypedGroup<FlxObject>;
    public var uiLayer:FlxTypedGroup<FlxObject>;

    function new()
    {
        super();

        current = this;

        gameObjects = [];

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
        super.update(elapsed);

        for (gameObject in gameObjects)
        {
            gameObject.update();
        }

        spriteLayer.sort(FlxSort.byY);
    }

    public function findObject(name:String):GameObject
    {
        for (gameObject in gameObjects)
        {
            if (gameObject.name == name)
            {
                return gameObject;
            }
        }

        throw "No game object with name \"" + name + "\" found";
    }

    function start()
    {
        for (gameObject in gameObjects)
        {
            gameObject.start();
        }
    }
}