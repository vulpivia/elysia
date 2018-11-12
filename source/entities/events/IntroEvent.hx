package entities.events;

import commands.CommandQueue;
import commands.ShowTextCommand;
import maps.Map;

/**
    The intro that plays on the first map.
**/
class IntroEvent extends Event
{
    override public function onStart()
    {
        var queue = new CommandQueue();

        queue.insert(new ShowTextCommand(Map.current.getCharacter("joshua_collier"), "So, you're ready?"));

        queue.run();
    }
}