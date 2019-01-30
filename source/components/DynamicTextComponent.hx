package components;

import flixel.text.FlxText;
import objects.GameObject;

class DynamicTextComponent extends Component
{
    public var text:String;

    var delay:Int;
    var timer:Int;
    var flxText:FlxText;
    var length:Int;

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
    }

    override public function update()
    {
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
}