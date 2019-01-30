package commands;

import flixel.math.FlxPoint;
import objects.GameObject;
import objects.TextBubble;
import states.State;

/**
    Opens a message window and displays text.
**/
class ShowTextCommand extends Command
{
    var characterName:String;
    var text:String;

    /**
        Opens a message window and displays text.

        @param character The character that says the text.
        @param text The content of the message window.
    **/
    public function new(characterName:String, text:String)
    {
        super();

        this.characterName = characterName;
        this.text = text;
    }

    override public function execute(callback:Void->Void) {
        super.execute(callback);

        var textBubble = new TextBubble(State.current.uiLayer, new FlxPoint(96, 32), text, 88);
        var character = State.current.findObject(characterName);
        textBubble.position = new FlxPoint(character.position.x - 36, character.position.y - 44);
        textBubble.start();

        State.current.gameObjects.push(textBubble);
    }
}