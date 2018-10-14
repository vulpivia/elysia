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

    private function createCommandWindow():Void
    {
        commandWindow = new CommandWindow(96, 128, 128);
        commandWindow.addCommand("New Game", commandNewGame);
        commandWindow.addCommand("Continue", commandContinue);
        commandWindow.addCommand("Shutdown", commandShutdown);

        add(commandWindow.sprite);
    }

    private function commandNewGame():Void
    {
        FlxG.switchState(new ExplorationState());
    }

    private function commandContinue():Void
    {
        FlxG.switchState(new MenuLoadState());
    }

    private function commandShutdown():Void
    {

    }

    override public function create():Void
    {
        drawBackground();
        drawTitle();

        createCommandWindow();

        super.create();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}