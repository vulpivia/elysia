package entities.characters;

/**
    A simple test character
**/
class TestCharacter extends Character
{
    public void onInteraction()
    {
        CommandQueue queue = new CommandQueue();

        queue.insert(new ShowTextEvent(this, "This is a test."));
        queue.insert(new ShowTextEvent(this, "This is part 2 of the test."));
    }
}