package maps;

import entities.events.IntroEvent;
import flixel.tile.FlxBaseTilemap;

/**
    A map for testing purposes.
**/
class TestMap extends Map
{
    public function new()
    {
        super();

        tilemap.loadMapFromCSV(AssetPaths.map_test__csv, AssetPaths.tileset_map__png, Map.TILE_SIZE, Map.TILE_SIZE);

        events.push(new IntroEvent());
    }
}