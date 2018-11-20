package objects;

import components.Component;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;

class GameObject
{
    public var active:Bool;
    public var position:FlxPoint;

    public var layer:FlxTypedGroup<FlxObject>;

    var components:Array<Component>;

    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        this.layer = layer;

        components = [];
    }

    public function start()
    {
        for (component in components)
        {
            component.start(this);
        }
    }

    public function update()
    {
        for (component in components)
        {
            component.update();
        }
    }

    /**
        Add a new component to the game object.

        @param component The component that should be added.
    **/
    public function addComponent(component:Component)
    {
        components.push(component);
    }

    /**
        Get a component from the game object.

        @param t Type of the component that should be searched for.
        @return The component that was found.
    **/
    public function getComponent(t:Class<Component>):Component
    {
        for (component in components)
        {
            if (Std.is(component, t))
            {
                return component;
            }
        }

        throw "Required component of type " + t + " not found";
    }
}