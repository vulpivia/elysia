package components;

import flixel.text.FlxText;
import objects.GameObject;

class TextComponent extends Component
{
    public var text:String;

    var flxText:FlxText;

    public function new(text:String)
    {
        this.text = text;
    }

    override public function start(gameObject:GameObject)
    {
        flxText = new FlxText(gameObject.position.x, gameObject.position.y);
        flxText.text = text;
        gameObject.layer.add(flxText);
    }

    override public function destroy()
    {
        flxText.destroy();
    }
}