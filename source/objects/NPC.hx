package objects;

import components.CharacterRendererComponent;

class NPC extends GameObject
{
    public function new()
    {
        addComponent(new CharacterRendererComponent());
    }
}