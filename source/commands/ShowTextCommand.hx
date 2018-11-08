package commands;

import entities.Character;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
    Opens a message window and displays text.
**/
class ShowTextCommand extends Command
{
    var text:FlxText;
    var fullText:String;

    /**
        Opens a message window and displays text.

        @param character The character that says the text.
        @param text The content of the message window.
    **/
    public function new(character:Character, text:String)
    {
        super();
        this.text = new FlxText(8, 8, 304, "");
        fullText = text;
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

        var textString = text.text;
        if (textString == fullText)
        {
            if (FlxG.keys.justPressed.ENTER)
            {
                text.destroy();
                finish();
            }
            return;
        }

        if (FlxG.keys.justPressed.ENTER)
        {
            textString = fullText;
        }
        else
        {
            textString += fullText.charAt(textString.length);
        }

        text.text = textString;
    }
}