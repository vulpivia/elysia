import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;

/**
    This class provides collision checks.
**/
class CollisionManager
{
    static var collisionMap:Array<Array<Bool>>;

    /**
        Check if a tile on the current map is blocked.

        @param position Position of the tile to check (in tiles).
        @return Returns true if the specified tile is blocked.
    **/
    public static function isBlocked(position:FlxPoint):Bool
    {
        var x = cast(position.x / Main.TILE_SIZE, Int);
        var y = cast(position.y / Main.TILE_SIZE, Int);
        return collisionMap[x][y];
    }

    /**
        Load and initialize a collision map.

        @param csv Path to the CSV file containing the map.
    **/
    public static function initializeCollisionMap(csv:String)
    {
        var tilemap = new FlxTilemap();
        tilemap.loadMapFromCSV(csv, null);

        collisionMap = [];

        for (x in 0...tilemap.widthInTiles)
        {
            collisionMap[x] = [];
            for (y in 0...tilemap.heightInTiles)
            {
                collisionMap[x][y] = tilemap.getTile(x, y) > 0;
            }
        }
    }
}