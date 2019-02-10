package components;

import flixel.FlxG;
import flixel.text.FlxText;
import objects.GameObject;

class DynamicTextComponent extends Component
{
    public var text:String;

    var delay:Int;
    var flxText:FlxText;
    var gameObject:GameObject;
    var length:Int;
    var timer:Int;

    public function new(text:String, length:Int)
    {
        this.text = text;
        this.length = length;
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