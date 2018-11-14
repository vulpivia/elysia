package commands;

import maps.Map;

class TeleportCommand extends Command
{
    var map:Map;
    var x:Int;
    var y:Int;

    /**
        Transports the player to a new map and/or a new position.

        @param map The map to transport the player to.
        @param x New x position of the player in tiles.
        @param y New y position of the player in tiles.
    **/
    public function new(map:Map, x:Int, y:Int)
    {
        super();

        this.map = map;
        this.x = x * Map.TILE_SIZE;
        this.y = y * Map.TILE_SIZE;
    }

    override public function update()
    {
        if (!executing)
        {
            return;
        }

        map.start();
        trace("Teleported");
        finish();
    }
}