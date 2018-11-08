package entities;

import flixel.FlxSprite;

/**
    A character in the game world.
**/
class Character extends Event
{
    var x:Int;
    var y:Int;

    var sprite:FlxSprite;

    /**
        Gets executed when the player interacts with this character.
    **/
    public function onInteraction()
    {

    }

    private function addAnimations(sprite:FlxSprite):FlxSprite
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
}