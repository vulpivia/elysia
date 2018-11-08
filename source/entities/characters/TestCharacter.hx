package entities.characters;


import commands.CommandQueue;
import commands.ShowTextCommand;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxRect;
/**
    A simple test character
**/
class TestCharacter extends Character
{
    override public function onStart()
    {
        var queue = new CommandQueue();

        queue.insert(new ShowTextCommand(this, "This is a test."));
        queue.insert(new ShowTextCommand(this, "This is part 2 of the test."));

        queue.run();
    }

    override public function create(state:FlxState)
    {
        sprite = new FlxSprite(0, -2);
        sprite.loadGraphic(AssetPaths.character_warrior__png, true, 16, 18);
        sprite = addAnimations(sprite);
        sprite.animation.play("idle_down");
        state.add(sprite);
    }

    override public function update()
    {
    }
}