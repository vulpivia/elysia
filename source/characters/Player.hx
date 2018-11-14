package characters;

import components.CharacterRendererComponent;
import components.InputControllerComponent;

class Player extends GameObject
{
    public function new()
    {
        addComponent(new CharacterRendererComponent());
        addComponent(new InputControllerComponent());
    }
}