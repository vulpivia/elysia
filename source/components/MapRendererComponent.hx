package components;

import flixel.tile.FlxTilemap;
import objects.GameObject;

/**
    Renders a single map layer.
**/
class MapRendererComponent extends Component
{
    /**
        The width of the map in tiles.
    **/
    public var width(get, null):Float;
    /**
        The height of the map in tiles.
    **/
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

    /**
        Load a map layer by its path.

        @param csv The path to the CSV file containing the layer data.
        @param tileset The path to the tileset that the layer uses.
    **/
    public function loadMap(csv:String, tileset:String)
    {
        tilemap = new FlxTilemap();
        tilemap.loadMapFromCSV(csv, tileset, Main.TILE_SIZE, Main.TILE_SIZE);
        tilemap.useScaleHack = false;
    }
}