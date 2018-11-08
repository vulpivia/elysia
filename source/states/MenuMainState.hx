package states;

import flixel.FlxSprite;
import ui.Option;
import ui.OptionWindow;

import flixel.FlxG;
import flixel.FlxState;

/**
    The main menu. This is the first state of the game.
**/
class MenuMainState extends State
{
    static inline var MAIN_MENU_WINDOW_X:Int = 96;
    static inline var MAIN_MENU_WINDOW_Y:Int = 144;
    static inline var MAIN_MENU_WINDOW_WIDTH:Int = 128;

    var optionWindow:OptionWindow;

    function createBackground()
    {
        var background = new FlxSprite();
        background.loadGraphic(AssetPaths.background_title__png);
        add(background);
    }

    function createOptionWindow()
    {
        optionWindow = new OptionWindow(MAIN_MENU_WINDOW_X, MAIN_MENU_WINDOW_Y, MAIN_MENU_WINDOW_WIDTH);
        optionWindow.addOption(new Option("New Game", optionNewGame));
        optionWindow.addOption(new Option("Continue", optionContinue));
        optionWindow.addOption(new Option("Shutdown", optionShutdown));
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
        createBackground();
        createOptionWindow();

        super.create();
    }
}