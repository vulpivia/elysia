package objects;

import components.CharacterRendererComponent;
import components.Component;
import events.Event;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import states.ExplorationState;
import states.State;

/**
	Base class of any game objects that can be added to a state. A game object consists of a list of independent components that may be used to handle things
	like specific game logic or object rendering.
**/
class GameObject {
	/**
		The name of the game object. This should be an unique string so that game objects can be searched for by their name.
	**/
	public var name:String;

	/**
		A flag that activates or deactivates the game object. An inactive game object doesn't update.
	**/
	public var active:Bool;

	/**
		The position of the game object (in pixels).
	**/
	public var position:FlxPoint;

	/**
		The layer that the game object exists on (impacts rendering).
	**/
	public var layer:FlxTypedGroup<FlxObject>;

	/**
		This event gets called when the game object is loaded.
	**/
	public var onStart:Event;

	/**
		This event gets called when the player enters the tile that this game object is located at.
	**/
	public var onEnter:Event;

	var components:Array<Component>;
	var started:Bool;
	var firstUpdate:Bool;
	var playerOnTile:Bool;

	public function new(layer:FlxTypedGroup<FlxObject>) {
		active = true;
		started = false;
		firstUpdate = true;
		playerOnTile = false;

		position = new FlxPoint(0, 0);

		this.layer = layer;

		components = [];
	}

	/**
		Called at the creation of the game object. This is used to initialize the game object and its components.
	**/
	public function start() {
		if (started) {
			return;
		}
		started = true;

		for (component in components) {
			component.start(this);
		}

		if (onStart != null) {
			onStart.run();
		}
	}

	/**
		Called every frame. This is used to update the game object and its components for game logic and rendering changes.
	**/
	public function update() {
		if (!active) {
			return;
		}

		// Check for player
		var state = State.stack.first();
		if (onEnter != null && Std.is(state, ExplorationState)) {
			var player = cast(State.stack.first(), ExplorationState).player;
			if (!playerOnTile && player.position.equals(position)) {
				// Player moved onto same tile

				// Stop player movement
				var playerRenderer = cast(player.getComponent(CharacterRendererComponent), CharacterRendererComponent);
				playerRenderer.idle = true;
				player.update();
				playerRenderer.idle = true;

				playerOnTile = true;
				onEnter.run();
			} else if (playerOnTile && !player.position.equals(position)) {
				// Player left same tile
				playerOnTile = false;
			}
		}

		// Skip update call on same frame as start
		if (firstUpdate) {
			firstUpdate = false;
			return;
		}

		for (component in components) {
			component.update();
		}
	}

	/**
		This function destroys the game object and removes it from the game state.
	**/
	public function destroy() {
		for (component in components) {
			component.destroy();
		}
		State.stack.first().removeObject(this);
	}

	/**
		Add a new component to the game object.

		@param component The component that should be added.
	**/
	public function addComponent(component:Component) {
		components.push(component);
	}

	/**
		Get a component from the game object.

		@param t Type of the component that should be searched for.
		@return The component that was found.
	**/
	public function getComponent(t:Class<Component>):Component {
		for (component in components) {
			if (Std.isOfType(component, t)) {
				return component;
			}
		}

		throw "Required component of type " + t + " not found";
	}
}
