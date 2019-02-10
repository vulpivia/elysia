package objects;

import components.Component;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import events.Event;

class GameObject
{
    public var name:String;
    public var active:Bool;
    public var position:FlxPoint;

    public var layer:FlxTypedGroup<FlxObject>;

    public var onStart:Event;

    var components:Array<Component>;

    public function new(layer:FlxTypedGroup<FlxObject>)
    {
        position = new FlxPoint(0, 0);

        this.layer = layer;

        components = [];
    }

    public function start()
    {
        for (component in components)
        {
            component.start(this);
        }

        if (onStart != null) {
            onStart.run();
        }
    }

    public function update()
    {
        for (component in components)
        {
            component.update();
        }
    }

    public function destroy()
    {
        for (component in components)
        {
            component.destroy();
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