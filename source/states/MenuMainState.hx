package states;

import flixel.FlxG;
import flixel.FlxSprite;
import openfl.system.System;
import ui.Option;
import ui.OptionWindow;

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
        Game.clear();
    }

    function optionContinue()
    {
        FlxG.switchState(new MenuLoadState());
        Game.clear();
    }

    function optionShutdown()
    {
        System.exit(0);
    }

    override public function create()
    {
        createBackground();
        createOptionWindow();

        super.create();
    }
}