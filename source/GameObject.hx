import components.IComponent;
import flixel.math.FlxPoint;

class GameObject
{
    public var active:Bool;
    public var position:FlxPoint;

    var components:Array<IComponent>;

    public function addComponent(component:IComponent)
    {
        components.push(component);
    }

    public function getComponent(t:Class<IComponent>):IComponent
    {
        return null;
    }
}