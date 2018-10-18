package;

import states.MenuMainState;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import openfl.display.Sprite;

/**
    The game.
**/
class Main extends Sprite
{
    static inline var SCREEN_WIDTH:Int = 320;
    static inline var SCREEN_HEIGHT:Int = 240;
    static inline var ZOOM:Int = 2;
    static inline var UPDATE_FPS:Int = 60;
    static inline var DRAW_FPS:Int = 60;

    /**
        Creates the game.
	**/
    public function new()
    {
        super();

        addChild(new FlxGame(SCREEN_WIDTH, SCREEN_HEIGHT, MenuMainState, ZOOM, UPDATE_FPS, DRAW_FPS, true));

        FlxG.scaleMode = new PixelPerfectScaleMode();
    }
}
