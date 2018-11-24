package states;

import components.MapRendererComponent;
import objects.Map;

/**
    In this state, the player can walk around the map and interact with objects and NPCs.
**/
class ExplorationState extends State
{
    var mapBottom:Map;
    var mapTop:Map;

    override public function create()
    {
        super.create();

        mapBottom = new Map(backgroundLayer);
        mapTop = new Map(foregroundLayer);

        var mapBottomRenderer = cast(mapBottom.getComponent(MapRendererComponent), MapRendererComponent);
        mapBottomRenderer.loadMap(AssetPaths.map_laboratory_bottom__csv, AssetPaths.tileset_map_bottom__png);

        var mapTopRenderer = cast(mapTop.getComponent(MapRendererComponent), MapRendererComponent);
        mapTopRenderer.loadMap(AssetPaths.map_laboratory_top__csv, AssetPaths.tileset_map_top__png);

        mapBottom.start();
        mapTop.start();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        mapBottom.update();
        mapTop.update();
    }
}
