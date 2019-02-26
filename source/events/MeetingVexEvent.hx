package events;

import commands.ShowTextCommand;
import commands.CommandQueue;

class MeetingVexEvent extends Event
{
    public function new()
    {
        queue = new CommandQueue();
        queue.insert(new ShowTextCommand("Vex", "Hey! Haven't seen you before..."));
    }
}