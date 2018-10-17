package ui;

import flixel.addons.ui.FlxUI9SliceSprite;
import flash.geom.Rectangle;
import flixel.FlxState;

class OptionWindow extends Window
{
    private var options = new List<Option>();

    /**
        Create a new option window. Height adjusts itself to fit the options.

        @param x x-coordinate of the window in pixels
        @param y y-coordinate of the window in pixels
        @param width width of the window in pixels
    **/
    public function new(state:FlxState, x:Int, y:Int, width:Int)
    {
        super(state, x, y, width, 32);

        var spritePath = "assets/images/tileset_selection.png";
        var size = new Rectangle(0, 0, width, 32);
        var slicePoints = [8, 8, 16, 16];

        var selectionSprite = new FlxUI9SliceSprite(x, y, spritePath, size, slicePoints);
        state.add(selectionSprite);
    }

    /**
        This function adds an option to the list of options of this window.

        @param text the shown text of the command
        @param option the function that is executed when the command is selected
    **/
    public function addOption(option:Option)
    {
        options.add(option);
    }
}