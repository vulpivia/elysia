package commands;

import states.State;

class Command extends GameObject implements IExecutable
{
    var callback:Void->Void;
    var executing:Bool;

    var state:State;

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

    override public function create(state:State)
    {
        super.create(state);
        this.state = state;
    }
}