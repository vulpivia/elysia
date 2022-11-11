package states;

import flixel.FlxState;

/**
	This class represents the root game state that persists throughout the game. The various game states are added as substates, which allows for state nesting.
**/
class RootState extends FlxState {
	/**
		The instance of the root state. Allows global access of the root state.
	**/
	public static var state:FlxState;

	public function new() {
		super();
		state = this;
	}
}
