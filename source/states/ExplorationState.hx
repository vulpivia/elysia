package states;

import maps.Map;

/**
    In this state, the player can walk around the map and interact with objects and NPCs.
**/
class ExplorationState extends State
{
    var mapType:Class<Map>;

    public function new(mapType:Class<Map>)
    {
        this.mapType = mapType;
        super();
    }

    override public function create()
    {
        var map = Type.createInstance(mapType, []);
        map.start();
        super.create();
    }
}
