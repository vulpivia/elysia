package components;

import flixel.text.FlxText;
import objects.GameObject;

class Option
{
    /**
        The text that is shown in the option window.
    **/
    public var text:String;
    /**
        The function that gets executed when this option is chosen.
    **/
    public var execute:Void->Void;

    public function new(text:String, execute:Void->Void)
    {
        this.text = text;
        this.execute = execute;
    }
}

class OptionComponent extends Component
{
    public var options:Array<Option>;

    public function new()
    {
        options = [];
    }

    override public function start(gameObject:GameObject)
    {
        for (i in 0...options.length)
        {
            var x = gameObject.position.x;
            var y = gameObject.position.y + i * 14;
            var text = new FlxText(x, y, 0, options[i].text);
            gameObject.layer.add(text);
        }
    }
}