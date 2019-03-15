package commands;

import states.State;
import components.ControllerComponent;

/**
    Moves a character by a specific number of tiles into the specified direction.
**/
class MoveCommand extends Command
{
    var characterName:String;
    var direction:Direction;
    var steps:Int;

    public function new(characterName:String, direction:Direction, steps:Int)
    {
        super();

        this.characterName = characterName;
        this.direction = direction;
        this.steps = steps;
    }

    override public function execute(callback:Void->Void)
    {
        super.execute(callback);

        var character = State.stack.first().findObject(characterName);
        var controller = cast(character.getComponent(ControllerComponent), ControllerComponent);
        controller.direction = direction;
        controller.stepCount = steps;
        controller.startMovement(callback);
    }
}