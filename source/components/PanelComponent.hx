package components;

import flash.geom.Rectangle;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.math.FlxPoint;
import objects.GameObject;

class PanelComponent extends Component
{
    public var size:FlxPoint;

    var padding:Int;

    public function new(padding:Int = 0)
    {
        this.padding = padding;
    }

    override public function start(gameObject:GameObject)
    {
        var size = new Rectangle(0, 0, size.x + padding * 2, size.y + padding * 2);
        var slicePoints = [8, 8, 16, 16];
        var x = gameObject.position.x - padding;
        var y = gameObject.position.y - padding;
        var sprite = new FlxUI9SliceSprite(x, y, AssetPaths.tileset_window__png, size, slicePoints);
        gameObject.layer.add(sprite);
    }
}