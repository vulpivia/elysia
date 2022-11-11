package components;

import objects.GameObject;

/**
	Components handle independent parts of game objects such as rendering or movement logic.
**/
class Component {
	/**
		Call the start function when the game object is loaded.

		@param gameObject The game object that this component belongs to.
	**/
	public function start(gameObject:GameObject) {
		// Placeholder
	}

	/**
		Call the update function each frame. Used to execute logic and rendering updates.
	**/
	public function update() {
		// Placeholder
	}

	/**
		Call the destroy function when the game object is destroyed. Used to destroy things like sprites that were created by this component.
	**/
	public function destroy() {
		// Placeholder
	}
}
