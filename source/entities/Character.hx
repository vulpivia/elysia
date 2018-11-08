package entities;

import flixel.FlxSprite;

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
    var x:Int;
    var y:Int;
    var direction:Direction;

    var sprite:FlxSprite;

    /**
        Gets executed when the player interacts with this character.
    **/
    public function onInteraction()
    {

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

    function move(direction:Direction)
    {
        if (x % 16 != 0 || y % 16 != 0)
        {
            continueMovement();
        }

        if (direction == Direction.None)
        {
            switchToIdle();
        }
        else if (direction == Direction.Up)
        {
            this.direction = Direction.Up;
            sprite.animation.play("walk_up");
            y--;
        }
        else if (direction == Direction.Down)
        {
            this.direction = Direction.Down;
            sprite.animation.play("walk_down");
            y++;
        }
        else if (direction == Direction.Left)
        {
            this.direction = Direction.Left;
            sprite.animation.play("walk_left");
            x--;
        }
        else
        {
            this.direction = Direction.Right;
            sprite.animation.play("walk_right");
            x++;
        }
    }
}