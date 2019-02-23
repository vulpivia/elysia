package events;

import commands.CommandQueue;
import commands.ShowTextCommand;
import commands.TeleportCommand;
import maps.LaboratoryMap;
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
        queue.insert(new TeleportCommand(LaboratoryMap, 1, 1));
    }
}