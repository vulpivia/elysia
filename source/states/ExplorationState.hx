package states;

import maps.TestMap;

/**
    In this state, the player can walk around the map and interact with objects and NPCs.
**/
class ExplorationState extends State
{
    override public function create()
    {
        var map = new TestMap();
        map.start();

        super.create();
    }
}
