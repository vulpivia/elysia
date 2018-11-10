import entities.characters.Player;
import flixel.FlxState;

/**
    Manages all game objects.
**/
class Game
{
    /**
        Width of the game screen in pixels before upscaling.
    **/
    public static inline var SCREEN_WIDTH:Int = 320;
    /**
        Height of the game screen in pixels before upscaling.
    **/
    public static inline var SCREEN_HEIGHT:Int = 240;

    public static var player:Player;

    static var gameObjects:Array<GameObject> = [];

    /**
        Add a game object to the game.

        @param gameObject the game object
    **/
    public static function add(gameObject:GameObject)
    {
        gameObjects.push(gameObject);
    }

    /**
        Updates all game objects. This gets called by the State class.
    **/
    public static function update()
    {
        for (gameObject in gameObjects)
        {
            gameObject.update();
        }
    }

    /**
        Creates all game objects. This gets called by the State class.

        @param state the current state
    **/
    public static function createObjects(state:FlxState)
    {
        for (gameObject in gameObjects)
        {
            gameObject.create(state);
        }
    }

    /**
        Removes all game objects.
    **/
    public static function clear()
    {
        gameObjects = [];
    }
}