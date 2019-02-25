import haxe.Timer;

class GameState
{
    public static var playTime(get, null):Float;
    public static var gold:Int = 0;

    static var playTimeOffset:Float;

    static function get_playTime()
    {
        return Timer.stamp() + playTimeOffset;
    }

    public static function initialize()
    {
        playTimeOffset = -Timer.stamp();
    }
}