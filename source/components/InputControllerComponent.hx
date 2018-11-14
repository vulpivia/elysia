package components;

import flixel.FlxG;
import flixel.math.FlxPoint;

enum Direction
{
    None;
    Up;
    Left;
    Down;
    Right;
}

class InputControllerComponent
{
    var characterRenderer:CharacterRendererComponent;

    var position:FlxPoint;
    
    public function start(gameObject:GameObject)
    {
        // Get required components
        characterRenderer = gameObject.getComponent<CharacterRendererComponent>();

        // Get position
        position = gameObject.position;
    }

    /**
        Movement on a grid by keyboard input.

        @param gameObject The game object to which this component belongs.
    **/
    public function update()
    {
        // Check if character is on grid
        if (onGrid(position))
        {
            // Read keyboard input
            var up = FlxG.keys.pressed.UP || FlxG.keys.pressed.W;
            var left = FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A;
            var down = FlxG.keys.pressed.DOWN || FlxG.keys.pressed.S;
            var right = FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D;

            // Set direction
            var direction = getDirection(up, left, down, right);

            // Start movement
            startMovement(direction);
        }
        else
        {

        }
    }

    function getDirection(up:Bool, left:Bool, down:Bool, right:Bool):Direction
    {
        if (up && !down)
        {
            return Direction.Up;
        }
        if (down && !up)
        {
            return Direction.Down;
        }
        if (left && right)
        {
            return Direction.Left;
        }
        if (right && left)
        {
            return Direction.Right;
        }

        return Direction.None;
    }

    function onGrid(position:FlxPoint):Bool
    {
        var xOffset = position.x % 16;
        var yOffset = position.y % 16;
        return xOffset == 0 && yOffset == 0;
    }

    function startMovement(direction:Direction)
    {
        switch (direction)
        {
            case Direction.None: stopMovement();
            case Direction.Up: startUpMovement();
            case Direction.Left: startLeftMovement();
            case Direction.Down: startDownMovement();
            case Direction.Right: startRightMovement();
        }
    }

    function startUpMovement()
    {
        characterRenderer.faceUp();

        // TODO: check for collision
        characterRenderer.idle = false;
        position.y--;
    }

    function startLeftMovement()
    {
        characterRenderer.faceLeft();

        // TODO: check for collision
        characterRenderer.idle = false;
        position.x--;
    }

    function startDownMovement()
    {
        characterRenderer.faceDown();

        // TODO: check for collision
        characterRenderer.idle = false;
        position.y++;
    }

    function startRightMovement()
    {
        characterRenderer.faceRight();

        // TODO: check for collision
        characterRenderer.idle = false;
        position.x++;
    }

    function stopMovement()
    {
        characterRenderer.idle = true;
    }
}