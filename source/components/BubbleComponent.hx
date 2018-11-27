package components;

import flixel.addons.ui.FlxUI9SliceSprite;
import objects.GameObject;
import openfl.geom.Rectangle;

class BubbleComponent extends Component
{
    public function new()
    {}
    
    override public function start(gameObject:GameObject)
    {
        var size = new Rectangle(0, 0, 128, 32);
        var slicePoints = [8, 8, 16, 16];
        var sprite = new FlxUI9SliceSprite(gameObject.position.x, gameObject.position.y, AssetPaths.tileset_message__png, size, slicePoints);
        gameObject.layer.add(sprite);
    }
}