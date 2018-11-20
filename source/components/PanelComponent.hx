package components;

import flash.geom.Rectangle;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.math.FlxPoint;
import objects.GameObject;

class PanelComponent extends Component
{
    public var position:FlxPoint;
    public var size:FlxPoint;

    public function new()
    {}

    public function start(gameObject:GameObject)
    {
        var size = new Rectangle(0, 0, size.x, size.y);
        var slicePoints = [8, 8, 16, 16];
        var sprite = new FlxUI9SliceSprite(position.x, position.y, AssetPaths.tileset_window__png, size, slicePoints);
    }
}