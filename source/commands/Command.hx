package commands;

import states.State;

class Command implements IExecutable {
	var callback:Void->Void;
	var executing:Bool;

	var state:State;

	public function new() {
		executing = false;
	}

	public function execute(callback:Void->Void) {
		this.callback = callback;
		executing = true;
	}

	function finish() {
		executing = false;
		callback();
	}
}
