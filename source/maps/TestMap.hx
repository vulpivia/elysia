package maps;

import entities.characters.Player;
import entities.characters.TestCharacter;
import flixel.FlxG;

/**
    A map for testing purposes.
**/
class TestMap extends Map
{
    public function new()
    {
        super();

        layerBottom.loadMapFromCSV(AssetPaths.map_test_bottom__csv, AssetPaths.tileset_map_bottom__png, Map.TILE_SIZE, Map.TILE_SIZE);
        layerTop.loadMapFromCSV(AssetPaths.map_test_top__csv, AssetPaths.tileset_map_top__png, Map.TILE_SIZE, Map.TILE_SIZE);

        FlxG.camera.setScrollBounds(0, layerBottom.width, 0, layerBottom.height);

        events.push(new Player());
        events.push(new TestCharacter());
    }
}