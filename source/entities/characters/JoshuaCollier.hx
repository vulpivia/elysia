package entities.characters;

import flixel.FlxSprite;
import maps.Map;
import states.State;

class JoshuaCollier extends Character
{
    override public function new()
    {
        super();
        name = "joshua_collier";
        x = 7 * Map.TILE_SIZE;
        y = 9 * Map.TILE_SIZE;
    }

    override public function create(state:State)
    {
        sprite = new FlxSprite(x - 4, y - 16);
        sprite.loadGraphic(AssetPaths.character_knight__png, true, 24, 32);
        sprite = addAnimations(sprite);
        sprite.animation.play("idle_right");
        state.middleLayer.add(sprite);
    }
}