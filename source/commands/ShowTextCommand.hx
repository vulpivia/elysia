package commands;

import objects.GameObject;
import objects.TextBubble;
import states.State;

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

    override public function execute(callback:Void->Void) {
        super.execute(callback);

        var textBubble = new TextBubble(State.current.uiLayer);
    }
}