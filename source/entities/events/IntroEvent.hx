package entities.events;

import commands.CommandQueue;
import commands.ShowTextCommand;

/**
    The intro that plays on the first map.
**/
class IntroEvent extends Event
{
    override public function onStart()
    {
        var queue = new CommandQueue();

        queue.insert(new ShowTextCommand(null, "Connection established."));
    }
}