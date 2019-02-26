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
    var padding:Int;
    var timer:Int;

    public function new(text:String, length:Int, padding:Int, callback:Void->Void)
    {
        this.text = text;
        this.length = length;
        this.padding = padding;
        this.callback = callback;
    }

    override public function start(gameObject:GameObject)
    {
        flxText = new FlxText(gameObject.position.x - 3 + padding + FlxG.camera.scroll.x, gameObject.position.y - 4 + padding + FlxG.camera.scroll.y);
        // TODO: Check if field width is correct (hint: it probably isn't)
        flxText.fieldWidth = length - padding * 2;

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