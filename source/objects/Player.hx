package objects;

import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import components.CharacterRendererComponent;
import components.InputControllerComponent;

class Player extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        super(layer);
        
        addComponent(new CharacterRendererComponent());
        addComponent(new InputControllerComponent());
    }
}