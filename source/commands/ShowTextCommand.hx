package commands;

import flixel.math.FlxPoint;
import objects.GameObject;
import objects.TextBox;
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

        if (characterName == null)
        {
            // Show textbox
            var textBox = new TextBox(State.stack.first().uiLayer, new FlxPoint(128, 36), text, 128, callback);
            textBox.position = new FlxPoint(Main.SCREEN_WIDTH - 140, 12);

            State.stack.first().gameObjects.push(textBox);
            textBox.start();
        }
        else
        {
            // Show bubble
            var textBubble = new TextBubble(State.stack.first().uiLayer, new FlxPoint(128, 26), text, 128, callback);
            var character = State.stack.first().findObject(characterName);
            textBubble.position = new FlxPoint(character.position.x - 56, character.position.y - 44);

            State.stack.first().gameObjects.push(textBubble);
            textBubble.start();
        }
    }
}