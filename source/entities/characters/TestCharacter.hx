package entities.characters;

import commands.CommandQueue;
import commands.ShowTextCommand;

/**
    A simple test character
**/
class TestCharacter extends Character
{
    override public function onStart()
    {
        var queue = new CommandQueue();

        queue.insert(new ShowTextCommand(this, "This is a test."));
        queue.insert(new ShowTextCommand(this, "This is part 2 of the test."));

        queue.run();
    }
}