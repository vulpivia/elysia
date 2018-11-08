package entities.characters;

import entities.Character;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import maps.Map;

class Player extends Character
{
    override public function new()
    {
        super();
        x = 8 * 16;
        y = 8 * 16;
        direction = Direction.Down;
    }

    override public function create(state:FlxState)
    {
        sprite = new FlxSprite(x, y - 2);
        sprite.loadGraphic(AssetPaths.character_warrior__png, true, 16, 18);
        sprite = addAnimations(sprite);
        sprite.animation.play("idle_down");
        state.add(sprite);
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

        sprite.setPosition(x, y - 2);
    }

    function getDirection()
    {
        var up = FlxG.keys.pressed.UP;
        var down = FlxG.keys.pressed.DOWN;
        var left = FlxG.keys.pressed.LEFT;
        var right = FlxG.keys.pressed.RIGHT;

        if (up && !down)
        {
            return Direction.Up;
        }

        if (down) {
            return Direction.Down;
        }

        if (left && !right)
        {
            return Direction.Left;
        }

        if (right)
        {
            return Direction.Right;
        }

        return Direction.None;
    }
}