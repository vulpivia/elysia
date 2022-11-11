package;

import flixel.FlxG;
import flixel.FlxGame;
import states.RootState;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import openfl.display.Sprite;
import states.MenuMainState;

/**
	The game.
**/
class Main extends Sprite {
	/**
		The screen width in pixels.
	**/
	public static inline var SCREEN_WIDTH:Int = 320;

	/**
		The screen height in pixels.
	**/
	public static inline var SCREEN_HEIGHT:Int = 240;

	static inline var DRAW_FPS:Int = 60;
	static inline var UPDATE_FPS:Int = 60;

	/**
		The size of one tile.
	**/
	public static inline var TILE_SIZE:Int = 16;

	/**
		The size of one UI tile.
	**/
	public static inline var UI_TILE_SIZE:Int = 8;

	/**
		The height of text.
	**/
	public static inline var TEXT_HEIGHT:Int = 7;

	/**
		Distance from one line of text to the next.
	**/
	public static inline var LINE_HEIGHT:Int = 10;

	/**
		Margin that gets added around text.
	**/
	public static inline var TEXT_MARGIN:Int = 2;

	/**
		Creates the game.
	**/
	public function new() {
		super();

		var game = new FlxGame(SCREEN_WIDTH, SCREEN_HEIGHT, RootState, 1, UPDATE_FPS, DRAW_FPS, true);
		addChild(game);

		FlxG.scaleMode = new PixelPerfectScaleMode();
		FlxG.mouse.useSystemCursor = true;

		RootState.state.openSubState(new MenuMainState());
	}
}
