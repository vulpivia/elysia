package states;

import components.MapRendererComponent;
import flixel.FlxG;
import flixel.math.FlxPoint;
import maps.Map;
import objects.MapLayer;
import objects.Player;

/**
    In this state, the player can walk around the map and interact with objects and NPCs.
**/
class ExplorationState extends State
{
    /**
        The player game object.
    **/
    public var player:Player;

    var mapType:Class<Map>;

    override public function new(mapType:Class<Map>, x:Int, y:Int)
    {
        super();
        this.mapType = mapType;

        player = new Player(spriteLayer);
        player.position = new FlxPoint(x * 16, y * 16);
    }

    override public function create()
    {
        super.create();

        var map = Type.createInstance(mapType, [gameObjects, spriteLayer]);

        CollisionManager.initializeCollisionMap(map.collisionCSV);

        var mapBottom = new MapLayer(backgroundLayer);
        var mapTop = new MapLayer(foregroundLayer);

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
