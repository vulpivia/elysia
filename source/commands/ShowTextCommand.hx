package commands;

import flixel.math.FlxPoint;
import objects.TextBox;
import objects.TextBubble;
import states.State;

/**
    Opens a message window and displays text.
**/
class ShowTextCommand extends Command
{
    static inline var WIDTH:Int = 128;

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

    override public function execute(callback:Void->Void)
    {
        super.execute(callback);

        if (characterName == null)
        {
            // Show textbox
            var height = Main.TEXT_HEIGHT + Main.LINE_HEIGHT * 2 + TextBox.PADDING * 2;
            var textBox = new TextBox(State.stack.first().uiLayer, new FlxPoint(WIDTH, height), text, WIDTH, callback);
            textBox.position = new FlxPoint(Main.SCREEN_WIDTH - WIDTH - 8, 8);

            State.stack.first().gameObjects.push(textBox);
            textBox.start();
        }
        else
        {
            // Show bubble
            var height = Main.TEXT_HEIGHT + Main.LINE_HEIGHT + TextBubble.PADDING * 2;
            var textBubble = new TextBubble(State.stack.first().uiLayer, new FlxPoint(WIDTH, height), text, WIDTH, callback);
            var character = State.stack.first().findObject(characterName);
            textBubble.position = new FlxPoint(character.position.x + (Main.TILE_SIZE / 2) - 64, character.position.y - 40);

            State.stack.first().gameObjects.push(textBubble);
            textBubble.start();
        }
    }
}