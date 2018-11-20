package components;

import flixel.math.FlxPoint;
import objects.GameObject;

enum Direction
{
    None;
    Up;
    Left;
    Down;
    Right;
}

class ControllerComponent extends Component
{
    var characterRenderer:CharacterRendererComponent;

    var direction:Direction;
    var position:FlxPoint;

    public function new()
    {}

    /**
        Get required components and set variables.

        @param gameObject The game object this component belongs to.
    **/
    override public function start(gameObject:GameObject)
    {
        // Get required components
        characterRenderer = cast(gameObject.getComponent(CharacterRendererComponent), CharacterRendererComponent);

        // Set variables
        direction = Direction.None;
        position = gameObject.position;
    }

    function continueMovement()
    {
        switch(direction)
        {
            case Direction.None: return;
            case Direction.Up: position.y--;
            case Direction.Left: position.x--;
            case Direction.Down: position.y++;
            case Direction.Right: position.x++;
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

    function startMovement()
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