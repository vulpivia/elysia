package components;

import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.math.FlxPoint;
import objects.GameObject;
import openfl.geom.Rectangle;

/**
    Renders a bubble. This bubble can be used as the background of text that is spoken by characters on screen.
**/
class BubbleComponent extends Component
{
    /**
        The size of the bubble in pixels.
    **/
    public var size:FlxPoint;

    var sprite:FlxUI9SliceSprite;

    public function new()
    {}

    override public function start(gameObject:GameObject)
    {
        var sizeRect = new Rectangle(0, 0, size.x, size.y);
        var slicePoints = [8, 8, 16, 16];
        var x = gameObject.position.x;
        var y = gameObject.position.y;
        sprite = new FlxUI9SliceSprite(x, y, AssetPaths.tileset_message__png, sizeRect, slicePoints);
        gameObject.layer.add(sprite);
    }

    override public function destroy()
    {
        sprite.destroy();
    }
}