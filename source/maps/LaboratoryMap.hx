package maps;

import events.IntroEvent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import objects.GameObject;
import objects.NPC;

/**
    The laboratory map in the intro of the game.
**/
class LaboratoryMap extends Map
{
    public function new(gameObjects:Array<GameObject>, spriteLayer:FlxTypedGroup<FlxObject>)
    {
        // Set map files
        bottomCSV = AssetPaths.map_laboratory_bottom__csv;
        topCSV = AssetPaths.map_laboratory_top__csv;
        collisionCSV = AssetPaths.map_laboratory_collision__csv;

        // Initialize character: Joshua Collier
        var joshuaCollier = new NPC(spriteLayer);
        joshuaCollier.name = "Joshua Collier";
        joshuaCollier.position = new FlxPoint(7 * Main.TILE_SIZE, 9 * Main.TILE_SIZE);

        joshuaCollier.onStart = new IntroEvent();

        gameObjects.push(joshuaCollier);
    }
}