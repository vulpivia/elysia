package entities.characters;

import commands.CommandQueue;
import commands.ShowTextCommand;

/**
    A simple test character
**/
class TestCharacter extends Character
{
    override public function onInteraction()
    {
        var queue = new CommandQueue();

        queue.insert(new ShowTextEvent(this, "This is a test."));
        queue.insert(new ShowTextEvent(this, "This is part 2 of the test."));
    }
}