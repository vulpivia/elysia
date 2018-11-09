package states;

import flixel.FlxState;

/**
    The base class for game states.
**/
class State extends FlxState
{
    override public function create()
    {
        Game.createObjects(this);

        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        Game.update();
    }
}