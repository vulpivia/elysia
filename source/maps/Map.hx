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

    var layerBottom:FlxTilemap;
    var layerTop:FlxTilemap;
    var events:Array<Event>;

    public function new()
    {
        super();

        layerBottom = new FlxTilemap();
        layerTop = new FlxTilemap();
        events = [];
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