package entities.events;

/**
    The intro that plays on the first map.
**/
class IntroEvent extends Event
{
    public void onStart()
    {
        CommandQueue queue = new CommandQueue();

        queue.insert(new ShowTextEvent(null, "Connection established."));
    }
}