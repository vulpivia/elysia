package maps;

import flixel.tile.FlxTilemap;
import flixel.FlxState;

/**
    The base class of a map.
**/
class Map
{
    var tilemap:FlxTilemap;

    public function new()
    {
        tilemap = new FlxTilemap();
    }

    /**
        Draws the map.

        @param state the state to draw to.
    **/
    public function draw(state:FlxState)
    {
        state.add(tilemap);
    }
}