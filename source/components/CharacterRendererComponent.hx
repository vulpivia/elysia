package components;

import flixel.animation.FlxAnimationController;

class CharacterRendererComponent extends Component
{
    /**
        If the character is currently moving or not.
    **/
    public var idle(null, set):Bool;

    var animation:FlxAnimationController;

    public function new()
    {}

    /**
        Switch idle status.

        @param idle New idle status.
        @return New idle status.
    **/
    public function set_idle(idle:Bool):Bool
    {
        if (idle)
        {
            // From walk to idle
            switch (animation.name)
            {
                case "walk_up": animation.play("idle_up");
                case "walk_right": animation.play("idle_right");
                case "walk_down": animation.play("idle_down");
                case "walk_left": animation.play("idle_left");
            }
        }
        else
        {
            // From idle to walk
            switch (animation.name)
            {
                case "idle_up": animation.play("walk_up");
                case "idle_right": animation.play("walk_right");
                case "idle_down": animation.play("walk_down");
                case "idle_left": animation.play("walk_left");
            }
        }

        return idle;
    }

    public function start(gameObject:GameObject)
    {
        animation.add("idle_up", [1], 0, true, false, false);
        animation.add("idle_right", [4], 0, true, false, false);
        animation.add("idle_down", [7], 0, true, false, false);
        animation.add("idle_left", [10], 0, true, false, false);

        animation.add("walk_up", [0, 1, 2, 1], 5, true, false, false);
        animation.add("walk_right", [3, 4, 5, 4], 5, true, false, false);
        animation.add("walk_down", [6, 7, 8, 7], 5, true, false, false);
        animation.add("walk_left", [9, 10, 11, 10], 5, true, false, false);
    }

    /**
        Set the character direction to up.
    **/
    public function faceUp()
    {
        if (idle)
        {
            animation.play("idle_up");
        }
        else
        {
            animation.play("walk_up");
        }
    }

    /**
        Set the character direction to left.
    **/
    public function faceLeft()
    {
        if (idle)
        {
            animation.play("idle_left");
        }
        else
        {
            animation.play("walk_left");
        }
    }

    /**
        Set the character direction to down.
    **/
    public function faceDown()
    {
        if (idle)
        {
            animation.play("idle_down");
        }
        else
        {
            animation.play("walk_down");
        }
    }

    /**
        Set the character direction to right.
    **/
    public function faceRight()
    {
        if (idle)
        {
            animation.play("idle_right");
        }
        else
        {
            animation.play("walk_right");
        }
    }
}