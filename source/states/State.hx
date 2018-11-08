package states;

import flixel.FlxState;

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