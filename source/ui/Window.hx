package ui;

import flash.geom.Rectangle;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxUI9SliceSprite;

class Window
{
    private static inline var SLICE_A_X = 8;
    private static inline var SLICE_A_Y = 8;
    private static inline var SLICE_B_X = 16;
    private static inline var SLICE_B_Y = 16;

    private var x:Int;
    private var y:Int;
    private var width:Int;
    private var height:Int;

    public var sprite(default, null):FlxSprite;

    private var spritePath = "assets/images/tileset_window.png";
    private var size:Rectangle;
    private var slicePoints = [SLICE_A_X, SLICE_A_Y, SLICE_B_X, SLICE_B_Y];

    /**
        Creates a new window.

        @param x x-coordinate of the window in pixels
        @param y y-coordinate of the window in pixels
        @param width width of the window in pixels
        @param height height of thei window in pixels
    **/
    public function new(x:Int, y:Int, width:Int, height:Int)
    {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    public function draw(state:FlxState)
    {
        size = new Rectangle(0, 0, width, height);
        
        sprite = new FlxUI9SliceSprite(x, y, spritePath, size, slicePoints);
        state.add(sprite);
    }
}