package states;

import flixel.FlxState;

class RootState extends FlxState
{
    public static var state:FlxState;

    public function new()
    {
        super();
        state = this;
    }
}