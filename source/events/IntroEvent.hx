package events;

import commands.CommandQueue;
import commands.ShowTextCommand;
import states.State;

class IntroEvent extends Event
{
    public function new()
    {
        queue = new CommandQueue();
        queue.insert(new ShowTextCommand("Joshua Collier", "Ready?"));
        queue.insert(new ShowTextCommand("Joshua Collier", "The connection will start in 3..."));
        queue.insert(new ShowTextCommand("Joshua Collier", "2..."));
        queue.insert(new ShowTextCommand("Joshua Collier", "1..."));
    }
}