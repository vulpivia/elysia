package states;

import flixel.FlxState;
import flixel.text.FlxText;

class ExplorationState extends FlxState
{
	override public function create():Void
	{
		add(new FlxText(10, 10, 100, "Hello World!"));
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
