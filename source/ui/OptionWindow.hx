package ui;

import flixel.text.FlxText;
import flixel.addons.ui.FlxUI9SliceSprite;
import flash.geom.Rectangle;
import flixel.FlxState;

class OptionWindow extends Window
{
    private var options = new List<Option>();

    private var selectionSpritePath = "assets/images/tileset_selection.png";

    /**
        Create a new option window. Height adjusts itself to fit the options.

        @param x x-coordinate of the window in pixels
        @param y y-coordinate of the window in pixels
        @param width width of the window in pixels
    **/
    public function new(x:Int, y:Int, width:Int)
    {
        super(x, y, width, 13);
    }

    public override function draw(state:FlxState)
    {
        super.draw(state);

        var size = new Rectangle(0, 0, width, 27);

        var selectionSprite = new FlxUI9SliceSprite(x, y, selectionSpritePath, size, slicePoints);
        state.add(selectionSprite);

        var testText = new FlxText(x + 8, y + 7, 0, "Test");
        state.add(testText);
    }

    /**
        This function adds an option to the list of options of this window.

        @param text the shown text of the command
        @param option the function that is executed when the command is selected
    **/
    public function addOption(option:Option)
    {
        options.add(option);
        height += 14;
    }
}