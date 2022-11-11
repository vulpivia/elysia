package events;

import commands.CommandQueue;
import commands.FadeCommand;
import commands.ShowTextCommand;
import commands.TeleportCommand;
import flixel.util.FlxColor;
import maps.PlainsStartMap;

/**
	This event plays the intro of the game.
**/
class IntroEvent extends Event {
	public function new() {
		queue = new CommandQueue();
		queue.insert(new ShowTextCommand("Joshua Collier", "Ready?"));
		queue.insert(new ShowTextCommand("Joshua Collier", "The connection will start in 3..."));
		queue.insert(new ShowTextCommand("Joshua Collier", "2..."));
		queue.insert(new ShowTextCommand("Joshua Collier", "1..."));
		queue.insert(new FadeCommand(FlxColor.WHITE, 2, false));
		queue.insert(new TeleportCommand(PlainsStartMap, 21, 4));
	}
}
