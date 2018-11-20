package objects;

import components.CharacterRendererComponent;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;

class NPC extends GameObject
{
    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        super(layer);
        
        addComponent(new CharacterRendererComponent());
    }
}