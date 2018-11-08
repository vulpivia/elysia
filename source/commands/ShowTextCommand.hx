package commands;

import entities.Character;

/**
    Opens a message window and displays text.
**/
class ShowTextCommand extends Command
{
    /**
        Opens a message window and displays text.

        @param character The character that says the text.
        @param text The content of the message window.
    **/
    public function new(character:Character, text:String)
    {
        super();
    }
}