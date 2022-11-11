package commands;

/**
	The interface that is used by events.
**/
interface IExecutable {
	public function execute(callback:Void->Void):Void;
	private function finish():Void;
}
