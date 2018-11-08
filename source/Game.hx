import flixel.FlxState;

class Game
{
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
}