package;

import states.MenuMainState;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import openfl.display.Sprite;

class Main extends Sprite
{
	private static inline var SCREEN_WIDTH = 320;
	private static inline var SCREEN_HEIGHT = 240;
	private static inline var ZOOM = 2;
	private static inline var UPDATE_FPS = 60;
	private static inline var DRAW_FPS = 60;

	public function new()
	{
		super();

		addChild(new FlxGame(SCREEN_WIDTH, SCREEN_HEIGHT, MenuMainState, ZOOM, UPDATE_FPS, DRAW_FPS, true));

		FlxG.scaleMode = new PixelPerfectScaleMode();
	}
}
