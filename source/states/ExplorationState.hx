package states;

import components.MapRendererComponent;
import flixel.FlxG;
import flixel.math.FlxPoint;
import maps.LaboratoryMap;
import objects.MapLayer;
import objects.Player;

/**
    In this state, the player can walk around the map and interact with objects and NPCs.
**/
class ExplorationState extends State
{
    override public function create()
    {
        super.create();

        var map = new LaboratoryMap();

        CollisionManager.initializeCollisionMap(map.collisionCSV);

        var mapBottom = new MapLayer(backgroundLayer);
        var mapTop = new MapLayer(foregroundLayer);

        var player = new Player(spriteLayer);
        player.position = new FlxPoint(128, 128);

        var mapBottomRenderer = cast(mapBottom.getComponent(MapRendererComponent), MapRendererComponent);
        mapBottomRenderer.loadMap(map.bottomCSV, AssetPaths.tileset_map_bottom__png);

        var mapTopRenderer = cast(mapTop.getComponent(MapRendererComponent), MapRendererComponent);
        mapTopRenderer.loadMap(map.topCSV, AssetPaths.tileset_map_top__png);

        FlxG.camera.setScrollBounds(0, mapBottomRenderer.width, 0, mapBottomRenderer.height);

        gameObjects.push(mapBottom);
        gameObjects.push(mapTop);

        gameObjects.push(player);

        start();
    }
}
