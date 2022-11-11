package components;

import flash.geom.Rectangle;
import flixel.FlxG;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.text.FlxText;
import objects.GameObject;

/**
	Represents an option that consists of the text that is displayed and the function that is executed when the option is chosen.
**/
class Option {
	/**
		The text that is shown in the option window.
	**/
	public var text:String;

	/**
		The function that gets executed when this option is chosen.
	**/
	public var execute:Void->Void;

	public function new(text:String, execute:Void->Void) {
		this.text = text;
		this.execute = execute;
	}
}

/**
	Displays a list of options and handles the input that the player uses to choose an option.
**/
class OptionListComponent extends Component {
	/**
		The height of a single option element.
	**/
	public static inline var LINE_HEIGHT:Int = 13;

	/**
		The list of options to choose from.
	**/
	public var options:Array<Option>;

	/**
		The function that is called when the player presses Escape while in the option list.
	**/
	public var cancel:Void->Void;

	var gameObject:GameObject;
	var index:Int;
	var selectionSprite:FlxUI9SliceSprite;

	public function new() {
		options = [];
	}

	override public function start(gameObject:GameObject) {
		var panelWidth = cast(gameObject.getComponent(PanelComponent), PanelComponent).size.x;
		var selectionSize = new Rectangle(0, 0, panelWidth, 20 + Main.TEXT_HEIGHT);
		var slicePoints = [
			Main.UI_TILE_SIZE,
			Main.UI_TILE_SIZE,
			Main.UI_TILE_SIZE * 2,
			Main.UI_TILE_SIZE * 2
		];
		selectionSprite = new FlxUI9SliceSprite(gameObject.position.x, gameObject.position.y, AssetPaths.tileset_selection__png, selectionSize, slicePoints);
		gameObject.layer.add(selectionSprite);

		for (i in 0...options.length) {
			var x = gameObject.position.x + 7;
			var y = gameObject.position.y + 6 + i * LINE_HEIGHT;
			var text = new FlxText(x, y, 0, options[i].text);
			gameObject.layer.add(text);
		}

		this.gameObject = gameObject;
	}

	override public function update() {
		if (cancel != null && FlxG.keys.justPressed.ESCAPE) {
			cancel();
		}

		if (FlxG.keys.justPressed.ENTER) {
			FlxG.sound.play(AssetPaths.decision_1__wav);

			options[index].execute();
			return;
		}

		var indexChanged = updateIndex();
		if (indexChanged) {
			FlxG.sound.play(AssetPaths.cursor__wav);
			selectionSprite.y = gameObject.position.y + index * LINE_HEIGHT + FlxG.camera.scroll.y;
		}
	}

	function updateIndex():Bool {
		var indexChanged = false;

		if (FlxG.keys.justPressed.UP) {
			index--;
			indexChanged = true;
		}

		if (FlxG.keys.justPressed.DOWN) {
			index++;
			indexChanged = true;
		}

		if (index < 0) {
			index += options.length;
		} else if (index >= options.length) {
			index = 0;
		}

		return indexChanged;
	}
}
