package entities.events;

import commands.CommandQueue;
import commands.ShowTextCommand;
import commands.TeleportCommand;
import maps.Map;
import maps.PlainsStartMap;

/**
    The intro that plays on the first map.
**/
class IntroEvent extends Event
{
    override public function onStart()
    {
        var queue = new CommandQueue();

        queue.insert(new ShowTextCommand(Map.current.getCharacter("joshua_collier"), "Ready?"));
        queue.insert(new ShowTextCommand(Map.current.getCharacter("joshua_collier"), "The connection process will start in 3..."));
        queue.insert(new ShowTextCommand(Map.current.getCharacter("joshua_collier"), "2..."));
        queue.insert(new ShowTextCommand(Map.current.getCharacter("joshua_collier"), "1..."));
        queue.insert(new TeleportCommand(new PlainsStartMap(), 5, 5));

        queue.run();
    }
}