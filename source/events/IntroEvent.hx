package events;

import commands.CommandQueue;
import commands.ShowTextCommand;
import states.State;

class IntroEvent extends Event
{
    public function new()
    {
        var joshuaCollier = State.current.findObject("Joshua Collier");

        var queue = new CommandQueue();
        queue.insert(new ShowTextCommand(joshuaCollier, "Ready?"));
        queue.insert(new ShowTextCommand(joshuaCollier, "The connection will start in 3..."));
        queue.insert(new ShowTextCommand(joshuaCollier, "2..."));
        queue.insert(new ShowTextCommand(joshuaCollier, "1..."));
    }
}