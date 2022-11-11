package commands;

import states.ExplorationState;
import states.State;

/**
	Manages a list of events.
**/
class CommandQueue {
	var commands:Array<IExecutable>;
	var commandIndex:Int;

	public function new() {
		commands = [];
		commandIndex = 0;
	}

	/**
		Adds a command to the queue.

		@param command The command which should be added to the queue.
	**/
	public function insert(command:IExecutable) {
		commands.push(command);
	}

	/**
		Runs the next command in the queue.
	**/
	public function run() {
		if (commandIndex == commands.length) {
			// Command queue finished
			switchPlayerInput(true);
			return;
		}

		switchPlayerInput(false);
		commands[commandIndex].execute(run);
		commandIndex++;
	}

	function switchPlayerInput(inputEnabled:Bool) {
		var state = cast(State.stack.first(), ExplorationState);
		state.findObject("Player").active = inputEnabled;
	}
}
