package ui;

import flash.geom.Rectangle;
import flixel.FlxSprite;
import flixel.addons.ui.FlxUI9SliceSprite;

class Window
{
    public var sprite(default, null):FlxSprite;

    /**
        Creates a new window.

        @param x x-coordinate of the window in pixels
        @param y y-coordinate of the window in pixels
        @param width width of the window in pixels
        @param height height of thei window in pixels
    **/
    public function new(state:FlxState, x:Int, y:Int, width:Int, height:Int)
    {
        var spritePath = "assets/images/tileset_window.png";
        var size = new Rectangle(0, 0, width, height);
        var slicePoints = [8, 8, 16, 16];

        sprite = new FlxUI9SliceSprite(x, y, spritePath, size, slicePoints);
        state.add(sprite);
    }
}