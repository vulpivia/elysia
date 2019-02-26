import haxe.Timer;

/**
    The game state manages various game data.
**/
class GameState
{
    /**
        The current play time of this game state in seconds.
    **/
    public static var playTime(get, null):Float;
    /**
        The current amount of gold that the player has.
    **/
    public static var gold:Int = 0;

    static var playTimeOffset:Float;

    static function get_playTime():Float
    {
        return Timer.stamp() + playTimeOffset;
    }

    /**
        Initialize a new game state. Run this at the beginning of a new game.
    **/
    public static function initialize()
    {
        playTimeOffset = -Timer.stamp();
    }
}