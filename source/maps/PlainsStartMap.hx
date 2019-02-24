package maps;

import events.MissionOneEvent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import objects.GameObject;

/**
    The first map where the player can freely move.
**/
class PlainsStartMap extends Map
{
    public function new(gameObjects:Array<GameObject>, spriteLayer:FlxTypedGroup<FlxObject>)
    {
        // Set map files
        bottomCSV = AssetPaths.map_plains_start_bottom__csv;
        topCSV = AssetPaths.map_plains_start_top__csv;
        collisionCSV = AssetPaths.map_plains_start_collision__csv;

        // Initialize mission one event
        var missionOneEvent = new GameObject(spriteLayer);
        missionOneEvent.name = "Mission One";
        missionOneEvent.onStart = new MissionOneEvent();

        gameObjects.push(missionOneEvent);
    }
}