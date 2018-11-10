package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import openfl.display.Sprite;
import states.MenuMainState;

/**
    The game.
**/
class Main extends Sprite
{
    static inline var ZOOM:Int = 2;
    static inline var UPDATE_FPS:Int = 60;
    static inline var DRAW_FPS:Int = 60;

    /**
        Creates the game.
	**/
    public function new()
    {
        super();

        var game = new FlxGame(Game.SCREEN_WIDTH, Game.SCREEN_HEIGHT, MenuMainState, ZOOM, UPDATE_FPS, DRAW_FPS, true);
        addChild(game);

        FlxG.scaleMode = new PixelPerfectScaleMode();
    }
}
