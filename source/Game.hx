import flixel.FlxState;

class Game
{
    public static inline var SCREEN_WIDTH:Int = 320;
    public static inline var SCREEN_HEIGHT:Int = 240;

    static var gameObjects:Array<GameObject> = [];

    public static function add(gameObject:GameObject)
    {
        gameObjects.push(gameObject);
    }

    public static function update()
    {
        for (gameObject in gameObjects)
        {
            gameObject.update();
        }
    }

    public static function createObjects(state:FlxState)
    {
        for (gameObject in gameObjects)
        {
            gameObject.create(state);
        }
    }

    public static function clear()
    {
        gameObjects = [];
    }
}