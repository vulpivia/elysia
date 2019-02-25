package components;

import flixel.FlxG;
import states.MenuPauseState;

/**
    Handles player input and moves the player accordingly.
**/
class InputControllerComponent extends ControllerComponent
{
    /**
        Movement on a grid by keyboard input.

        @param gameObject The game object to which this component belongs.
    **/
    override public function update()
    {
        if (FlxG.keys.pressed.ESCAPE)
        {
            // Open menu
            FlxG.switchState(new MenuPauseState());
        }

        // Check if character is on grid
        if (onGrid(position))
        {
            // Read keyboard input
            var up = FlxG.keys.pressed.UP || FlxG.keys.pressed.W;
            var left = FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A;
            var down = FlxG.keys.pressed.DOWN || FlxG.keys.pressed.S;
            var right = FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D;

            // Set direction
            direction = getDirection(up, left, down, right);

            // Start movement
            startMovement();
        }
        else
        {
            continueMovement();
        }
    }
}