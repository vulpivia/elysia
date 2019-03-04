package objects;

import components.CharacterRendererComponent;
import components.ControllerComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
    Any character that isn't controlled by the player.
**/
class NPC extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        super(layer);

        addComponent(new CharacterRendererComponent());
        addComponent(new ControllerComponent());
    }
}