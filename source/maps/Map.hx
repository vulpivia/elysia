package maps;

import entities.Event;
import flixel.FlxState;
import flixel.tile.FlxTilemap;

/**
    The base class of a map.
**/
class Map
{
    static inline var TILE_SIZE:Int = 16;

    var tilemap:FlxTilemap;
    var events:Array<Event>;

    public function new()
    {
        tilemap = new FlxTilemap();
        events = [];
    }

    /**
        Draws the map.

        @param state the state to draw to.
    **/
    public function draw(state:FlxState)
    {
        state.add(tilemap);
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