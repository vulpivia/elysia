package maps;

import entities.characters.Player;
import entities.characters.TestCharacter;
import entities.events.IntroEvent;

/**
    A map for testing purposes.
**/
class TestMap extends Map
{
    public function new()
    {
        super();

        tilemap.loadMapFromCSV(AssetPaths.map_test_bottom__csv, AssetPaths.tileset_map_bottom__png, Map.TILE_SIZE, Map.TILE_SIZE);

        //events.push(new IntroEvent());
        events.push(new Player());
        events.push(new TestCharacter());
    }
}