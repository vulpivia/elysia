package commands;

import states.State;
import components.ControllerComponent;

class MoveCommand extends Command
{
    var characterName:String;
    var direction:Direction;

    public function new(characterName:String, direction:Direction)
    {
        super();

        this.characterName = characterName;
        this.direction = direction;
    }

    override public function execute(callback:Void->Void)
    {
        super.execute(callback);

        var character = State.stack.first().findObject(characterName);
        var controller = cast(character.getComponent(ControllerComponent), ControllerComponent);
        controller.direction = direction;
        controller.startMovement(callback);
    }
}