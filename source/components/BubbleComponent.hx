package components;

import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.math.FlxPoint;
import objects.GameObject;
import openfl.geom.Rectangle;

class BubbleComponent extends Component
{
    private var size:FlxPoint;
    private var sprite:FlxUI9SliceSprite;

    public function new(size:FlxPoint)
    {
        this.size = size;
    }

    override public function start(gameObject:GameObject)
    {
        var sizeRect = new Rectangle(0, 0, size.x, size.y);
        var slicePoints = [8, 8, 16, 16];
        var x = gameObject.position.x - 4;
        var y = gameObject.position.y - 4;
        sprite = new FlxUI9SliceSprite(x, y, AssetPaths.tileset_message__png, sizeRect, slicePoints);
        gameObject.layer.add(sprite);
    }

    override public function destroy()
    {
        trace("Destroy bubble");
        sprite.destroy();
    }
}