package ui;

import flash.geom.Rectangle;
import flixel.addons.ui.FlxUI9SliceSprite;

class Window
{
    /**
        Creates a new window.

        @param x x-coordinate of the window in pixels
        @param y y-coordinate of the window in pixels
        @param width width of the window in pixels
        @param height height of thei window in pixels
    **/
    public function new(x:Int, y:Int, width:Int, height:Int)
    {
        var spritePath = "assets/images/tileset_window.png";
        var size = new Rectangle(0, 0, width, height);

        var sprite = new FlxUI9SliceSprite(x, y, spritePath, size);
    }
}