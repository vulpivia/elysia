package commands;

/**
    Manages a list of events.
**/
class CommandQueue
{
    var commands:Array<IExecutable>;
    var commandIndex:Int;

    public function new()
    {
        commands = [];
        commandIndex = 0;
    }

    /**
        Adds a command to the queue.

        @param command The command which should be added to the queue.
    **/
    public function insert(command:IExecutable)
    {
        commands.push(command);
    }

    public function run()
    {
        if (commandIndex == commands.length)
        {
            // Command queue finished
            return;
        }

        commands[commandIndex].execute(run);
        commandIndex++;
    }
}