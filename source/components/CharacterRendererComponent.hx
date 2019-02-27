package components;

import flixel.FlxSprite;
import flixel.animation.FlxAnimationController;
import objects.GameObject;

/**
    This component renders a character.
**/
class CharacterRendererComponent extends Component
{
    static inline var SPRITE_WIDTH:Int = 24;
    static inline var SPRITE_HEIGHT:Int = 32;

    /**
        If the character is currently moving or not.
    **/
    public var idle(null, set):Bool;

    /**
        The rendered sprite of the character.
    **/
    public var sprite:FlxSprite;
    var animation:FlxAnimationController;
    var gameObject:GameObject;

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

    override public function start(gameObject:GameObject)
    {
        this.gameObject = gameObject;

        sprite = new FlxSprite(gameObject.position.x - (SPRITE_WIDTH - Main.TILE_SIZE) / 2, gameObject.position.y + (Main.TILE_SIZE - SPRITE_HEIGHT));
        sprite.loadGraphic(AssetPaths.character_knight__png, true, SPRITE_WIDTH, SPRITE_HEIGHT);
        animation = sprite.animation;

        animation.add("idle_up", [1], 0, true, false, false);
        animation.add("idle_right", [4], 0, true, false, false);
        animation.add("idle_down", [7], 0, true, false, false);
        animation.add("idle_left", [10], 0, true, false, false);

        animation.add("walk_up", [0, 1, 2, 1], 5, true, false, false);
        animation.add("walk_right", [3, 4, 5, 4], 5, true, false, false);
        animation.add("walk_down", [6, 7, 8, 7], 5, true, false, false);
        animation.add("walk_left", [9, 10, 11, 10], 5, true, false, false);

        animation.play("idle_down");

        gameObject.layer.add(sprite);
    }

    override public function update()
    {
        sprite.x = gameObject.position.x - 4;
        sprite.y = gameObject.position.y - 16;
    }

    /**
        Set the character direction to up.
    **/
    public function faceUp()
    {
        if (idle)
        {
            if (animation.name != "idle_up")
            {
                animation.play("idle_up");
            }
        }
        else
        {
            if (animation.name != "walk_up")
            {
                animation.play("walk_up");
            }
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