package states;

import ui.Option;
import ui.OptionWindow;

import flixel.FlxG;
import flixel.FlxState;

/**
    The main menu. This is the first state of the game.
**/
class MenuMainState extends FlxState
{
    static inline var MAIN_MENU_WINDOW_X:Int = 96;
    static inline var MAIN_MENU_WINDOW_Y:Int = 128;
    static inline var MAIN_MENU_WINDOW_WIDTH:Int = 128;

    var optionWindow:OptionWindow;

    function drawBackground()
    {
        // Should draw a background image.
    }

    function drawTitle()
    {
        // Should draw the game logo.
    }

    function createOptionWindow()
    {
        optionWindow = new OptionWindow(MAIN_MENU_WINDOW_X, MAIN_MENU_WINDOW_Y, MAIN_MENU_WINDOW_WIDTH);
        optionWindow.addOption(new Option("New Game", optionNewGame));
        optionWindow.addOption(new Option("Continue", optionContinue));
        optionWindow.addOption(new Option("Shutdown", optionShutdown));

        optionWindow.draw(this);
    }

    function optionNewGame()
    {
        FlxG.switchState(new ExplorationState());
    }

    function optionContinue()
    {
        FlxG.switchState(new MenuLoadState());
    }

    function optionShutdown()
    {
        // Should end the game.
    }

    override public function create()
    {
        drawBackground();
        drawTitle();

        createOptionWindow();

        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }
}