package maps;

import entities.Event;
import flixel.FlxState;
import flixel.tile.FlxTilemap;

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
        events = [];

        current = this;
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

        var tile = layerCollision.getTile(x, y);
        return tile > 0;
    }

    /**
        Draws the map.

        @param state the state to draw to.
    **/
    override public function create(state:FlxState)
    {
        state.add(layerBottom);
        state.add(layerTop);
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