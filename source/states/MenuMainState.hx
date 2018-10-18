package states;

import ui.Option;
import ui.OptionWindow;

import flixel.FlxG;
import flixel.FlxState;

class MenuMainState extends FlxState
{
    private static inline var MAIN_MENU_WINDOW_X = 96;
    private static inline var MAIN_MENU_WINDOW_Y = 128;
    private static inline var MAIN_MENU_WINDOW_WIDTH = 128;

    private var optionWindow:OptionWindow;

    private function drawBackground():Void
    {

    }

    private function drawTitle():Void
    {

    }

    private function createOptionWindow():Void
    {
        optionWindow = new OptionWindow(MAIN_MENU_WINDOW_X, MAIN_MENU_WINDOW_Y, MAIN_MENU_WINDOW_WIDTH);
        optionWindow.addOption(new Option("New Game", optionNewGame));
        optionWindow.addOption(new Option("Continue", optionContinue));
        optionWindow.addOption(new Option("Shutdown", optionShutdown));

        optionWindow.draw(this);
    }

    private function optionNewGame():Void
    {
        FlxG.switchState(new ExplorationState());
    }

    private function optionContinue():Void
    {
        FlxG.switchState(new MenuLoadState());
    }

    private function optionShutdown():Void
    {

    }

    override public function create():Void
    {
        drawBackground();
        drawTitle();

        createOptionWindow();

        super.create();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}