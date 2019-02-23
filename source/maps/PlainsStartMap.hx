package maps;

import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import objects.GameObject;

class PlainsStartMap extends Map
{
    public function new(gameObjects:Array<GameObject>, spriteLayer:FlxTypedGroup<FlxObject>)
    {
        // Set map files
        bottomCSV = AssetPaths.map_plains_start_bottom__csv;
        topCSV = AssetPaths.map_plains_start_top__csv;
        collisionCSV = AssetPaths.map_plains_start_collision__csv;
    }

    /*override public function start()
    {
        layerBottom.loadMapFromCSV(AssetPaths.map_plains_start_bottom__csv, AssetPaths.tileset_map_bottom__png, Map.TILE_SIZE, Map.TILE_SIZE);
        layerTop.loadMapFromCSV(AssetPaths.map_plains_start_top__csv, AssetPaths.tileset_map_top__png, Map.TILE_SIZE, Map.TILE_SIZE);
        layerCollision.loadMapFromCSV(AssetPaths.map_plains_start_collision__csv, null);

        FlxG.camera.setScrollBounds(0, layerBottom.width, 0, layerBottom.height);

        events.push(new MissionOneEvent());
        events.push(new Player());

        super.start();
    }*/
}