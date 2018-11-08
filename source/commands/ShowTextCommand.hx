package commands;

import entities.Character;
import flixel.FlxState;
import flixel.text.FlxText;

/**
    Opens a message window and displays text.
**/
class ShowTextCommand extends Command
{
    var text:FlxText;

    /**
        Opens a message window and displays text.

        @param character The character that says the text.
        @param text The content of the message window.
    **/
    public function new(character:Character, text:String)
    {
        super();
        this.text = new FlxText(8, 8, "");
    }

    override public function create(state:FlxState)
    {
        super.create(state);
        state.add(text);
    }

    override public function update()
    {
        if (!executing)
        {
            return;
        }

        // TODO: Update the text
    }
}