package maps;

import entities.events.MissionOneEvent;
import flixel.FlxG;

class PlainsStartMap extends Map
{
    override public function start()
    {
        layerBottom.loadMapFromCSV(AssetPaths.map_plains_start_bottom__csv, AssetPaths.tileset_map_bottom__png, Map.TILE_SIZE, Map.TILE_SIZE);
        layerTop.loadMapFromCSV(AssetPaths.map_plains_start_top__csv, AssetPaths.tileset_map_top__png, Map.TILE_SIZE, Map.TILE_SIZE);
        layerCollision.loadMapFromCSV(AssetPaths.map_plains_start_collision__csv, null);

        FlxG.camera.setScrollBounds(0, layerBottom.width, 0, layerBottom.height);

        events.push(new MissionOneEvent());
        events.push(new Player());

        super.start();
    }
}