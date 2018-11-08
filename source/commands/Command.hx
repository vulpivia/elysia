package commands;

import flixel.FlxState;

class Command extends GameObject implements IExecutable
{
    var callback:Void->Void;
    var executing:Bool;

    var state:FlxState;

    public function new()
    {
        super();
        executing = false;
    }

    public function execute(callback:Void->Void)
    {
        this.callback = callback;
        executing = true;
    }

    function finish()
    {
        callback();
    }

    override public function create(state:FlxState)
    {
        super.create(state);
        this.state = state;
    }
}