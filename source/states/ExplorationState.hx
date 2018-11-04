package states;

import flixel.FlxState;
import maps.TestMap;

/**
    In this state, the player can walk around the map and interact with objects and NPCs.
**/
class ExplorationState extends FlxState
{
    override public function create()
    {
        super.create();

        var map = new TestMap();
        map.draw(this);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }
}
