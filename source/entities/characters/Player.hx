package entities.characters;

import entities.Character;
import flixel.FlxG;
import flixel.FlxSprite;
import maps.Map;
import states.State;

class Player extends Character
{
    public var inputEnabled:Bool;

    override public function new()
    {
        super();
        name = "player";

        // Set player position only when first player is created and not on map change
        if (Game.player == null)
        {
            x = 10 * Map.TILE_SIZE;
            y = 9 * Map.TILE_SIZE;
        }
        else
        {
            x = Game.player.x;
            y = Game.player.y;
        }

        direction = Direction.Down;

        Game.player = this;
        inputEnabled = true;
    }

    override public function create(state:State)
    {
        sprite = new FlxSprite();
        sprite.loadGraphic(AssetPaths.character_knight__png, true, 24, 32);
        sprite = addAnimations(sprite);
        sprite.animation.play("idle_down");
        state.middleLayer.add(sprite);

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