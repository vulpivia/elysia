package events;

import commands.CommandQueue;

/**
    Events define a list of commands that are run once the event gets executed.
**/
class Event
{
    var queue:CommandQueue;

    /**
        Run the commands contained in this event.
    **/
    public function run()
    {
        if (queue != null)
        {
            queue.run();
        }
    }
}