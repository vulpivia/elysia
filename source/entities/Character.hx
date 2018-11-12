package entities;

import flixel.FlxSprite;
import maps.Map;

enum Direction
{
    Up;
    Down;
    Left;
    Right;
    None;
}

/**
    A character in the game world.
**/
class Character extends Event
{
    public var name:String;
    public var x:Int;
    public var y:Int;
    var direction:Direction;

    public var sprite:FlxSprite;

    /**
        Gets executed when the player interacts with this character.
    **/
    public function onInteraction()
    {
        // No interaction for the base character
    }

    function addAnimations(sprite:FlxSprite):FlxSprite
    {
        sprite.animation.add("idle_up", [1], 0, true, false, false);
        sprite.animation.add("idle_right", [4], 0, true, false, false);
        sprite.animation.add("idle_down", [7], 0, true, false, false);
        sprite.animation.add("idle_left", [10], 0, true, false, false);

        sprite.animation.add("walk_up", [0, 1, 2, 1], 5, true, false, false);
        sprite.animation.add("walk_right", [3, 4, 5, 4], 5, true, false, false);
        sprite.animation.add("walk_down", [6, 7, 8, 7], 5, true, false, false);
        sprite.animation.add("walk_left", [9, 10, 11, 10], 5, true, false, false);

        return sprite;
    }

    function switchToIdle()
    {
        if (sprite.animation.name == "walk_up")
        {
            sprite.animation.play("idle_up");
        }
        else if (sprite.animation.name == "walk_down")
        {
            sprite.animation.play("idle_down");
        }
        else if (sprite.animation.name == "walk_left")
        {
            sprite.animation.play("idle_left");
        }
        else if (sprite.animation.name == "walk_right")
        {
            sprite.animation.play("idle_right");
        }
    }

    function continueMovement()
    {
        if (direction == Direction.Up)
        {
            y--;
        }
        else if (direction == Direction.Down)
        {
            y++;
        }
        else if (direction == Direction.Left)
        {
            x--;
        }
        else
        {
            x++;
        }
    }

    function startWalkUp()
    {
        if (Map.current.isBlocked(x, y - Map.TILE_SIZE))
        {
            sprite.animation.play("idle_up");
            return;
        }

        this.direction = Direction.Up;
        sprite.animation.play("walk_up");
        y--;
    }

    function startWalkDown()
    {
        if (Map.current.isBlocked(x, y + Map.TILE_SIZE))
        {
            sprite.animation.play("idle_down");
            return;
        }

        this.direction = Direction.Down;
        sprite.animation.play("walk_down");
        y++;
    }

    function startWalkLeft()
    {
        if (Map.current.isBlocked(x - Map.TILE_SIZE, y))
        {
            sprite.animation.play("idle_left");
            return;
        }

        this.direction = Direction.Left;
        sprite.animation.play("walk_left");
        x--;
    }

    function startWalkRight()
    {
        if (Map.current.isBlocked(x + Map.TILE_SIZE, y))
        {
            sprite.animation.play("idle_right");
            return;
        }

        this.direction = Direction.Right;
        sprite.animation.play("walk_right");
        x++;
    }

    function move(direction:Direction)
    {
        if (x % Map.TILE_SIZE != 0 || y % Map.TILE_SIZE != 0)
        {
            continueMovement();
            return;
        }

        switch (direction)
        {
            case Direction.None: switchToIdle();
            case Direction.Up: startWalkUp();
            case Direction.Down: startWalkDown();
            case Direction.Left: startWalkLeft();
            case Direction.Right: startWalkRight();
        }
    }
}