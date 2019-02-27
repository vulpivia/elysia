package components;

import flash.geom.Rectangle;
import flixel.FlxG;
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

    var sprite:FlxUI9SliceSprite;

    public function new()
    {}

    override public function start(gameObject:GameObject)
    {
        var sizeRect = new Rectangle(0, 0, size.x, size.y);
        var slicePoints = [Main.UI_TILE_SIZE, Main.UI_TILE_SIZE, Main.UI_TILE_SIZE * 2, Main.UI_TILE_SIZE * 2];
        var x = gameObject.position.x + FlxG.camera.scroll.x;
        var y = gameObject.position.y + FlxG.camera.scroll.y;
        sprite = new FlxUI9SliceSprite(x, y, AssetPaths.tileset_window__png, sizeRect, slicePoints);
        gameObject.layer.add(sprite);
    }

    override public function destroy()
    {
        sprite.destroy();
    }
}