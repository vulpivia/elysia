import states.State;

class GameObject
{
    public function new()
    {
        Game.add(this);
    }

    /**
        Gets called when the game object is created.

        @param state the game state that this game object belongs to
    **/
    public function create(state:State)
    {}

    /**
        Gets called every frame and is used to handle the logic of the game object.
    **/
    public function update()
    {}
}