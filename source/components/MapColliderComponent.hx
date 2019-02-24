package components;

import flixel.tile.FlxTilemap;
import objects.GameObject;

class MapColliderComponent extends Component
{
    override public function start(gameObject:GameObject)
    {
        var layerCollision = new FlxTilemap();
    }
}