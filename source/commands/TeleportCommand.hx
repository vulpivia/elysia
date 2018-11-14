package commands;

import states.ExplorationState;
import flixel.FlxG;
import maps.Map;

class TeleportCommand extends Command
{
    var mapType:Class<Map>;
    var x:Int;
    var y:Int;

    /**
        Transports the player to a new map and/or a new position.

        @param map The map to transport the player to.
        @param x New x position of the player in tiles.
        @param y New y position of the player in tiles.
    **/
    public function new(mapType:Class<Map>, x:Int, y:Int)
    {
        super();

        this.mapType = mapType;
        this.x = x * Map.TILE_SIZE;
        this.y = y * Map.TILE_SIZE;
    }

    override public function update()
    {
        if (!executing)
        {
            return;
        }

        FlxG.switchState(new ExplorationState(mapType));
        
        Game.player.x = this.x;
        Game.player.y = this.y;

        finish();
    }
}