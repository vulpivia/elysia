package maps;

import events.MeetingVexEvent;
import events.MissionOneEvent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import objects.GameObject;
import objects.NPC;

/**
	The first map where the player can freely move.
**/
class PlainsStartMap extends Map {
	public function new(gameObjects:Array<GameObject>, spriteLayer:FlxTypedGroup<FlxObject>) {
		// Set map files
		bottomCSV = AssetPaths.map_plains_start_bottom__csv;
		topCSV = AssetPaths.map_plains_start_top__csv;
		collisionCSV = AssetPaths.map_plains_start_collision__csv;

		// Initialize character: Vex
		var vex = new NPC(spriteLayer);
		vex.name = "Vex";
		vex.position = new FlxPoint(43 * Main.TILE_SIZE, 10 * Main.TILE_SIZE);

		// Initialize mission one event
		var missionOneEvent = new GameObject(spriteLayer);
		missionOneEvent.name = "Mission One";
		missionOneEvent.onStart = new MissionOneEvent();

		// Initialize meeting Vex event
		var meetingVexEvent = new MeetingVexEvent();
		// 34, 10
		var meetingVexEventA = new GameObject(spriteLayer);
		meetingVexEventA.name = "Meeting Vex A";
		meetingVexEventA.position = new FlxPoint(34 * Main.TILE_SIZE, 10 * Main.TILE_SIZE);
		meetingVexEventA.onEnter = meetingVexEvent;
		// 34, 11
		var meetingVexEventB = new GameObject(spriteLayer);
		meetingVexEventB.name = "Meeting Vex B";
		meetingVexEventB.position = new FlxPoint(34 * Main.TILE_SIZE, 11 * Main.TILE_SIZE);
		meetingVexEventB.onEnter = meetingVexEvent;
		// 34, 12
		var meetingVexEventC = new GameObject(spriteLayer);
		meetingVexEventC.name = "Meeting Vex C";
		meetingVexEventC.position = new FlxPoint(34 * Main.TILE_SIZE, 12 * Main.TILE_SIZE);
		meetingVexEventC.onEnter = meetingVexEvent;

		gameObjects.push(vex);
		gameObjects.push(missionOneEvent);
		gameObjects.push(meetingVexEventA);
		gameObjects.push(meetingVexEventB);
		gameObjects.push(meetingVexEventC);
	}
}
