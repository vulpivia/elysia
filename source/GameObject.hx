import flixel.FlxState;

class GameObject
{
    public function new()
    {
        Game.add(this);
    }

    public function create(state:FlxState)
    {}

    public function update()
    {}
}