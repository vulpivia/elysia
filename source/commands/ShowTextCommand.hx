package commands;

import states.State;
import objects.GameObject;

/**
    Opens a message window and displays text.
**/
class ShowTextCommand extends Command
{
    var characterName:String;

    /**
        Opens a message window and displays text.

        @param character The character that says the text.
        @param text The content of the message window.
    **/
    public function new(characterName:String, text:String)
    {
        super();

        this.characterName = characterName;
    }
}