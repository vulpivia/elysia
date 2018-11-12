package entities.characters;


import commands.CommandQueue;
import commands.ShowTextCommand;
import flixel.FlxSprite;
import maps.Map;
import states.State;
/**
    A simple test character
**/
class TestCharacter extends Character
{
    override public function new()
    {
        super();
        name = "test_character";
        x = 5 * Map.TILE_SIZE;
        y = 6 * Map.TILE_SIZE;
    }

    override public function onStart()
    {
        var queue = new CommandQueue();

        queue.insert(new ShowTextCommand(this, "This is a test."));
        queue.insert(new ShowTextCommand(this, "This is part 2 of the test."));

        queue.run();
    }

    override public function create(state:State)
    {
        sprite = new FlxSprite(x - 4, y - 16);
        sprite.loadGraphic(AssetPaths.character_vex__png, true, 24, 32);
        sprite = addAnimations(sprite);
        sprite.animation.play("idle_down");
        state.middleLayer.add(sprite);
    }

    override public function update()
    {
    }
}