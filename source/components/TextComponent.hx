package components;

import flixel.FlxG;
import flixel.text.FlxText;
import objects.GameObject;

/**
    Show text on the screen.
**/
class TextComponent extends Component
{
    /**
        The text that should be rendered.
    **/
    public var text:String;
    var padding:Int;
    var alignment:FlxTextAlign;

    /**
        The text object.
    **/
    public var flxText:FlxText;

    public function new(text:String, padding:Int, alignment:FlxTextAlign)
    {
        this.text = text;
        this.padding = padding;
        this.alignment = alignment;
    }

    override public function start(gameObject:GameObject)
    {
        flxText = new FlxText(gameObject.position.x - 3 + padding, gameObject.position.y - 4 + padding);
        flxText.text = text;
        flxText.alignment = alignment;
        gameObject.layer.add(flxText);
    }

    override public function destroy()
    {
        flxText.destroy();
    }
}