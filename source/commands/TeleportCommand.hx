package commands;

import flixel.FlxG;
import maps.Map;
import states.ExplorationState;
import states.RootState;

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
        this.x = x;
        this.y = y;
    }

    override public function execute(callback:Void->Void)
    {
        super.execute(callback);

        var state = new ExplorationState(mapType, x, y);
        RootState.state.closeSubState();
        RootState.state.openSubState(state);
    }
}