package components;

import flixel.text.FlxText;
import objects.GameObject;

class TextComponent extends Component
{
    public var text:String;
    var padding:Int;

    var flxText:FlxText;

    public function new(text:String, padding:Int)
    {
        this.text = text;
        this.padding = padding;
    }

    override public function start(gameObject:GameObject)
    {
        flxText = new FlxText(gameObject.position.x - 3 + padding, gameObject.position.y - 4 + padding);
        flxText.text = text;
        gameObject.layer.add(flxText);
    }

    override public function destroy()
    {
        flxText.destroy();
    }
}