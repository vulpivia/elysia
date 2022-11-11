package objects;

import components.DynamicTextComponent;
import components.PanelComponent;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;

/**
	A textbox containing some text. Used for dialogue by characters that aren't present.
**/
class TextBox extends GameObject {
	/**
		Padding between the outer border of the panel and the text. The panel gets expanded, text starts at the position of the game object.
	**/
	public static inline var PADDING:Int = 8;

	public function new(layer:FlxTypedGroup<FlxObject>, size:FlxPoint, text:String, length:Int, callback:Void->Void) {
		super(layer);

		var panel = new PanelComponent();
		panel.size = size;
		addComponent(panel);
		addComponent(new DynamicTextComponent(text, length, PADDING, callback));
	}

	override public function start() {
		position.x += FlxG.camera.scroll.x;
		position.y += FlxG.camera.scroll.y;
		super.start();
	}
}
