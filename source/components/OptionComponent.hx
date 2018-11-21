package components;

import flash.geom.Rectangle;
import flixel.addons.ui.FlxUI9SliceSprite;
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
        var panelWidth = cast(gameObject.getComponent(PanelComponent), PanelComponent).size.x;
        var selectionSize = new Rectangle(0, 0, panelWidth, 27);
        var slicePoints = [8, 8, 16, 16];
        var selectionSprite = new FlxUI9SliceSprite(gameObject.position.x, gameObject.position.y, AssetPaths.tileset_selection__png, selectionSize, slicePoints);
        gameObject.layer.add(selectionSprite);

        for (i in 0...options.length)
        {
            var x = gameObject.position.x + 8;
            var y = gameObject.position.y + 7 + i * 14;
            var text = new FlxText(x, y, 0, options[i].text);
            gameObject.layer.add(text);
        }
    }
}