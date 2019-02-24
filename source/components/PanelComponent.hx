package components;

import flash.geom.Rectangle;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.math.FlxPoint;
import objects.GameObject;

/**
    Renders a panel. Useful for UI elements such as menus and textboxes.
**/
class PanelComponent extends Component
{
    /**
        Size of the panel in pixels.
    **/
    public var size:FlxPoint;

    var padding:Int;
    var sprite:FlxUI9SliceSprite;

    public function new(padding:Int = 0)
    {
        this.padding = padding;
    }

    override public function start(gameObject:GameObject)
    {
        var sizeRect = new Rectangle(0, 0, size.x + padding * 2, size.y + padding * 2);
        var slicePoints = [8, 8, 16, 16];
        var x = gameObject.position.x - padding;
        var y = gameObject.position.y - padding;
        sprite = new FlxUI9SliceSprite(x, y, AssetPaths.tileset_window__png, sizeRect, slicePoints);
        gameObject.layer.add(sprite);
    }

    override public function destroy()
    {
        sprite.destroy();
    }
}