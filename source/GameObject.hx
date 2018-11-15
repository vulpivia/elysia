import components.Component;
import flixel.math.FlxPoint;

class GameObject
{
    public var active:Bool;
    public var position:FlxPoint;

    var components:Array<Component>;

    public function addComponent(component:Component)
    {
        components.push(component);
    }

    public function getComponent(t:Class<Component>):Component
    {
        return null;
    }
}