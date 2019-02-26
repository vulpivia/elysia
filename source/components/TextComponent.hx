package components;

import flixel.FlxG;
import flixel.text.FlxText;
import objects.GameObject;

class TextComponent extends Component
{
    public var text:String;
    var padding:Int;
    var alignment:FlxTextAlign;

    public var flxText:FlxText;

    public function new(text:String, padding:Int, alignment:FlxTextAlign)
    {
        this.text = text;
        this.padding = padding;
        this.alignment = alignment;
    }

    override public function start(gameObject:GameObject)
    {
        flxText = new FlxText(gameObject.position.x - 3 + FlxG.camera.scroll.x + padding, gameObject.position.y - 4 + padding  + FlxG.camera.scroll.y);
        flxText.text = text;
        flxText.alignment = alignment;
        gameObject.layer.add(flxText);
    }

    override public function destroy()
    {
        flxText.destroy();
    }
}