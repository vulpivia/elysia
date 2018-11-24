package components;

import flixel.tile.FlxTilemap;
import objects.GameObject;

class MapRendererComponent extends Component
{
    var tilemap:FlxTilemap;

    public function new()
    {
    }

    override public function start(gameObject:GameObject)
    {
        gameObject.layer.add(tilemap);
    }

    public function loadMap(csv:String, tileset:String)
    {
        tilemap = new FlxTilemap();
        tilemap.loadMapFromCSV(csv, tileset, 16, 16);
        tilemap.useScaleHack = false;
    }
}