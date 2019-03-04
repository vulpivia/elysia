package events;

import commands.CommandQueue;
import commands.MoveCommand;
import commands.ShowTextCommand;
import components.ControllerComponent;

/**
    Gets executed when the player first meets Vex.
**/
class MeetingVexEvent extends Event
{
    public function new()
    {
        queue = new CommandQueue();
        queue.insert(new ShowTextCommand(null, "Hey! Haven't seen you before..."));
        queue.insert(new MoveCommand("Vex", Direction.Left));
        queue.insert(new ShowTextCommand("Vex", "Test"));
    }
}