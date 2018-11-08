package commands;

class Command extends GameObject implements IExecutable
{
    var callback:Void->Void;

    public function execute(callback:Void->Void)
    {
        this.callback = callback;
    }

    function finish()
    {
        callback();
    }
}