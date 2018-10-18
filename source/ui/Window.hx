package ui;

import flash.geom.Rectangle;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxUI9SliceSprite;

/**
    A window to display content in the game.
**/
class Window
{
    static inline var SLICE_A_X:Int = 8;
    static inline var SLICE_A_Y:Int = 8;
    static inline var SLICE_B_X:Int = 16;
    static inline var SLICE_B_Y:Int = 16;

    static inline var SPRITE_PATH:String = "assets/images/tileset_window.png";

    var x:Int;
    var y:Int;
    var width:Int;
    var height:Int;

    var sprite(default, null):FlxSprite;
    var size:Rectangle;
    var slicePoints:Array<Int>;

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

        slicePoints = [SLICE_A_X, SLICE_A_Y, SLICE_B_X, SLICE_B_Y];
    }

    /**
        Draws the window.

        @param state the state to draw to.
    **/
    public function draw(state:FlxState)
    {
        size = new Rectangle(0, 0, width, height);

        sprite = new FlxUI9SliceSprite(x, y, SPRITE_PATH, size, slicePoints);
        state.add(sprite);
    }
}