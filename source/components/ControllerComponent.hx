package components;

import flixel.math.FlxPoint;
import objects.GameObject;

/**
    Possible directions that a character can face.
**/
enum Direction
{
    None;
    Up;
    Left;
    Down;
    Right;
}

/**
    This component handles character movement on a grid.
**/
class ControllerComponent extends Component
{
    var characterRenderer:CharacterRendererComponent;

    public var direction:Direction;
    public var stepCount:Int;
    var position:FlxPoint;

    var callback:Void->Void;

    public function new()
    {
        stepCount = 1;
    }

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

    override public function update()
    {
        if (onGrid(position))
        {
            if (stepCount > 1)
            {
                stepCount--;
                continueMovement();
                return;
            }
            stopMovement();
        }
        else
        {
            continueMovement();
        }
    }

    function continueMovement()
    {
        switch (direction)
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
        if (left && !right)
        {
            return Direction.Left;
        }
        if (right && !left)
        {
            return Direction.Right;
        }

        return Direction.None;
    }

    function onGrid(position:FlxPoint):Bool
    {
        var xOffset = position.x % Main.TILE_SIZE;
        var yOffset = position.y % Main.TILE_SIZE;
        return xOffset == 0 && yOffset == 0;
    }

    /**
        Start to move in the current direction.

        @param callback An optional function that gets executed when the movement is completed.
    **/
    public function startMovement(callback:Void->Void = null)
    {
        this.callback = callback;

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

        if (CollisionManager.isBlocked(new FlxPoint(position.x, position.y - Main.TILE_SIZE)))
        {
            return;
        }
        characterRenderer.idle = false;
        position.y--;
    }

    function startLeftMovement()
    {
        characterRenderer.faceLeft();

        if (CollisionManager.isBlocked(new FlxPoint(position.x - Main.TILE_SIZE, position.y)))
        {
            return;
        }
        characterRenderer.idle = false;
        position.x--;
    }

    function startDownMovement()
    {
        characterRenderer.faceDown();

        if (CollisionManager.isBlocked(new FlxPoint(position.x, position.y + Main.TILE_SIZE)))
        {
            return;
        }
        characterRenderer.idle = false;
        position.y++;
    }

    function startRightMovement()
    {
        characterRenderer.faceRight();

        if (CollisionManager.isBlocked(new FlxPoint(position.x + Main.TILE_SIZE, position.y)))
        {
            return;
        }
        characterRenderer.idle = false;
        position.x++;
    }

    function stopMovement()
    {
        characterRenderer.idle = true;

        if (callback != null)
        {
            // Create copy to check if the callback was changed (by the next event)
            var callbackTemp = Reflect.copy(callback);
            callback();
            // Only reset if the callback isn't used by the next event
            if (callback == callbackTemp)
            {
                callback = null;
            }
        }
    }
}