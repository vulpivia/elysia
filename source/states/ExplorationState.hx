package states;

import objects.Map;

/**
    In this state, the player can walk around the map and interact with objects and NPCs.
**/
class ExplorationState extends State
{
    var map:Map;

    override public function create()
    {
        super.create();

        map = new Map(backgroundLayer, foregroundLayer);
        
        map.start();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        map.update();
    }
}
