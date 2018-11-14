package entities.events;

import commands.CommandQueue;
import commands.ShowTextCommand;

class MissionOneEvent extends Event
{
    override public function onStart()
    {
        var queue = new CommandQueue();

        queue.insert(new ShowTextCommand(null, "Alright, seems like we are connected."));
        queue.insert(new ShowTextCommand(null, "There's an area to the north of you that we currently can't read. Please check it out and report back."));
    }
}