package maps;

import entities.characters.Player;
import flixel.FlxG;

class LaboratoryMap extends Map
{
    public function new()
    {
        super();

        layerBottom.loadMapFromCSV(AssetPaths.map_laboratory_bottom__csv, AssetPaths.tileset_map_bottom__png, Map.TILE_SIZE, Map.TILE_SIZE);
        layerTop.loadMapFromCSV(AssetPaths.map_laboratory_top__csv, AssetPaths.tileset_map_top__png, Map.TILE_SIZE, Map.TILE_SIZE);
        layerCollision.loadMapFromCSV(AssetPaths.map_laboratory_collision__csv, null);

        FlxG.camera.setScrollBounds(0, layerBottom.width, 0, layerBottom.height);

        events.push(new Player());
    }
}