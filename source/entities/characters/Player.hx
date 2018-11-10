package entities.characters;

import entities.Character;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import maps.Map;

class Player extends Character
{
    public var inputEnabled:Bool;

    override public function new()
    {
        super();
        x = 8 * 16;
        y = 8 * 16;
        direction = Direction.Down;

        Game.player = this;
        inputEnabled = true;
    }

    override public function create(state:FlxState)
    {
        sprite = new FlxSprite(x, y - 2);
        sprite.loadGraphic(AssetPaths.character_knight__png, true, 24, 32);
        sprite = addAnimations(sprite);
        sprite.animation.play("idle_down");
        state.add(sprite);

        FlxG.camera.follow(sprite);
    }

    override public function update()
    {
        if (x % Map.TILE_SIZE != 0 || y % Map.TILE_SIZE != 0)
        {
            continueMovement();
        }
        else
        {
            move(getDirection());
        }

        sprite.setPosition(x - 4, y - 16);
    }

    function getDirection()
    {
        if (!inputEnabled)
        {
            return Direction.None;
        }

        var up = FlxG.keys.pressed.UP;
        var down = FlxG.keys.pressed.DOWN;
        var left = FlxG.keys.pressed.LEFT;
        var right = FlxG.keys.pressed.RIGHT;

        if (up && !down)
        {
            return Direction.Up;
        }

        if (down && !up) {
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
}