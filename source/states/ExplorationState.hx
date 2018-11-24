package states;

import components.MapRendererComponent;
import objects.Map;
import objects.Player;

/**
    In this state, the player can walk around the map and interact with objects and NPCs.
**/
class ExplorationState extends State
{
    override public function create()
    {
        super.create();

        CollisionManager.initializeCollisionMap(AssetPaths.map_laboratory_collision__csv);

        var mapBottom = new Map(backgroundLayer);
        var mapTop = new Map(foregroundLayer);

        var player = new Player(spriteLayer);

        var mapBottomRenderer = cast(mapBottom.getComponent(MapRendererComponent), MapRendererComponent);
        mapBottomRenderer.loadMap(AssetPaths.map_laboratory_bottom__csv, AssetPaths.tileset_map_bottom__png);

        var mapTopRenderer = cast(mapTop.getComponent(MapRendererComponent), MapRendererComponent);
        mapTopRenderer.loadMap(AssetPaths.map_laboratory_top__csv, AssetPaths.tileset_map_top__png);

        gameObjects.push(mapBottom);
        gameObjects.push(mapTop);

        gameObjects.push(player);

        start();
    }
}
