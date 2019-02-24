package components;

import flixel.FlxG;
import flixel.text.FlxText;
import objects.GameObject;

/**
    Continuously displays a text on the screen which is removed when the player presses the enter key.
**/
class DynamicTextComponent extends Component
{
    /**
        The text that is displayed.
    **/
    public var text:String;

    var callback:Void->Void;
    var delay:Int;
    var flxText:FlxText;
    var gameObject:GameObject;
    var length:Int;
    var timer:Int;

    public function new(text:String, length:Int, callback:Void->Void)
    {
        this.text = text;
        this.length = length;
        this.callback = callback;
    }

    override public function start(gameObject:GameObject)
    {
        flxText = new FlxText(gameObject.position.x, gameObject.position.y);
        flxText.fieldWidth = length;

        gameObject.layer.add(flxText);

        this.gameObject = gameObject;
    }

    override public function update()
    {
        if (flxText.text == text)
        {
            // Text fully loaded
            if (FlxG.keys.justPressed.ENTER)
            {
                callback();
                gameObject.destroy();
            }

            return;
        }

        if (FlxG.keys.justPressed.ENTER)
        {
            flxText.text = text;
        }

        if (text != flxText.text)
        {
            if (timer >= delay)
            {
                flxText.text += text.charAt(flxText.text.length);
                timer = 0;
            }
            else
            {
                timer++;
            }
        }
    }

    override public function destroy()
    {
        flxText.destroy();
    }
}