package maps;

import entities.Character;
import entities.Event;
import flixel.tile.FlxTilemap;
import states.State;

/**
    The base class of a map.
**/
class Map extends GameObject
{
    /**
        Width and height of a single tile.
    **/
    public static inline var TILE_SIZE:Int = 16;

    /**
        The current map.
    **/
    public static var current:Map;

    var layerBottom:FlxTilemap;
    var layerTop:FlxTilemap;
    var layerCollision:FlxTilemap;
    var events:Array<Event>;

    public function new()
    {
        super();

        layerBottom = new FlxTilemap();
        layerTop = new FlxTilemap();
        layerCollision = new FlxTilemap();

        layerBottom.useScaleHack = false;
        layerTop.useScaleHack = false;
        events = [];

        current = this;
    }

    function characterAt(x:Int, y:Int):Bool
    {
        for (event in events)
        {
            if (Std.is(event, Character))
            {
                var character = cast(event, Character);
                if (character.x == x && character.y == y)
                {
                    return true;
                }
            }
        }

        return false;
    }

    /**
        Check collision for tile at position.

        @param x x position of tile to check in pixels
        @param y y position of tile to check in pixels

        @return true if blocked
    **/
    public function isBlocked(x:Int, y:Int):Bool
    {
        x = cast(x / TILE_SIZE);
        y = cast(y / TILE_SIZE);

        if (x < 0 || y < 0 || x >= layerBottom.widthInTiles || y >= layerBottom.heightInTiles)
        {
            return true;
        }

        var tile = layerCollision.getTile(x, y);
        if (tile > 0)
        {
            return true;
        }

        return characterAt(x * TILE_SIZE, y * TILE_SIZE);
    }

    /**
        Draws the map.

        @param state the state to draw to.
    **/
    override public function create(state:State)
    {
        state.backgroundLayer.add(layerBottom);
        state.foregroundLayer.add(layerTop);
    }

    /**
        Tells all events to execute their starting scripts.
    **/
    public function start()
    {
        for (event in events)
        {
            event.onStart();
        }
    }
}