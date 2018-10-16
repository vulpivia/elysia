package states;

import ui.CommandWindow;

import flixel.FlxG;
import flixel.FlxState;

class MenuMainState extends FlxState
{
    private var commandWindow:CommandWindow;

    private function drawBackground():Void
    {

    }

    private function drawTitle():Void
    {

    }

    private function createOptionWindow():Void
    {
        optionWindow = new OptionWindow(96, 128, 128);
        optionWindow.addOption("New Game", optionNewGame);
        optionWindow.addOption("Continue", optionContinue);
        optionWindow.addOption("Shutdown", optionShutdown);
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