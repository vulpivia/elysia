package;

import states.MenuMainState;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		addChild(new FlxGame(320, 240, MenuMainState, 2, 60, 60, true));

		FlxG.scaleMode = new PixelPerfectScaleMode();
	}
}
