package commands;

import flixel.util.FlxColor;
import states.State;

/**
	Fades the screen to a specific color. Useful for fade to black and back.
**/
class FadeCommand extends Command {
	var color:FlxColor;
	var duration:Float;
	var fadeIn:Bool;

	public function new(color:FlxColor, duration:Float, fadeIn:Bool) {
		super();

		this.color = color;
		this.duration = duration;
		this.fadeIn = fadeIn;
	}

	override public function execute(callback:Void->Void) {
		super.execute(callback);

		State.stack.first().camera.fade(color, duration, fadeIn, callback);
	}
}
