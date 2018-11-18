package components;

import flixel.tile.FlxTilemap;
import objects.GameObject;

class MapRendererComponent extends Component
{
    public function start(gameObject:GameObject)
    {
        var layerBottom = new FlxTilemap();
        var layerTop = new FlxTilemap();

        layerBottom.useScaleHack = false;
        layerTop.useScaleHack = false;
    }
}