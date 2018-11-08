package commands;

class Command extends GameObject implements IExecutable
{
    var callback:Void->Void;
    var executing:Bool;

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
}