package components;

import flixel.tile.FlxTilemap;
import objects.GameObject;

class MapRendererComponent extends Component
{
    public var width(get, null):Float;
    public var height(get, null):Float;

    var tilemap:FlxTilemap;

    public function new()
    {
    }

    public function get_width():Float
    {
        return tilemap.width;
    }

    public function get_height():Float
    {
        return tilemap.height;
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