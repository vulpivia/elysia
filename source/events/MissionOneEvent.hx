package events;

import commands.CommandQueue;
import commands.FadeCommand;
import commands.ShowTextCommand;
import flixel.util.FlxColor;

/**
	This event continues the intro after the the map change.
**/
class MissionOneEvent extends Event {
	public function new() {
		queue = new CommandQueue();
		queue.insert(new FadeCommand(FlxColor.WHITE, 2, true));
		queue.insert(new ShowTextCommand(null, "Alright, seems like we are connected."));
		queue.insert(new ShowTextCommand(null, "There's an area to the north of you that we currently can't read."));
		queue.insert(new ShowTextCommand(null, "Please check it out and report back."));
	}
}
