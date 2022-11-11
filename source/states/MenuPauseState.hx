package states;

import components.OptionListComponent;
import components.PanelComponent;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import objects.InfoWindow;
import objects.OptionWindow;

/**
	The pause menu which is accessed by pressing escape.
**/
class MenuPauseState extends State {
	/**
		Width of the menu.
	**/
	static inline var MENU_WIDTH:Int = 96;

	/**
		Height of the menu.
	**/
	static inline var MENU_HEIGHT:Int = 128;

	override public function create() {
		super.create();

		var menu = new OptionWindow(uiLayer);
		menu.position = new FlxPoint(Main.SCREEN_WIDTH - MENU_WIDTH - 8, 8);

		var menuPanel = cast(menu.getComponent(PanelComponent), PanelComponent);
		menuPanel.size = new FlxPoint(MENU_WIDTH, MENU_HEIGHT);

		var menuOption = cast(menu.getComponent(OptionListComponent), OptionListComponent);
		menuOption.options.push(new Option("Inventory", optionInventory));
		menuOption.options.push(new Option("Equipment", optionEquipment));
		menuOption.options.push(new Option("Status", optionStatus));
		menuOption.options.push(new Option("Save", optionSave));
		menuOption.options.push(new Option("Quit", optionQuit));
		menuOption.cancel = close;

		var infoHeight = Main.TEXT_HEIGHT + InfoWindow.PADDING * 2;

		var goldInfo = new InfoWindow(uiLayer, new FlxPoint(MENU_WIDTH, infoHeight), GameState.gold + " G", FlxTextAlign.RIGHT);
		goldInfo.position = new FlxPoint(Main.SCREEN_WIDTH - MENU_WIDTH - 8, Main.SCREEN_HEIGHT - infoHeight - 8);

		var timeInfo = new InfoWindow(uiLayer, new FlxPoint(MENU_WIDTH, infoHeight), Util.displayTime(GameState.playTime), FlxTextAlign.RIGHT);
		timeInfo.position = new FlxPoint(8, Main.SCREEN_HEIGHT - infoHeight - 8);

		gameObjects.push(menu);
		gameObjects.push(goldInfo);
		gameObjects.push(timeInfo);

		start();
	}

	function optionInventory() {
		// TODO
	}

	function optionEquipment() {
		// TODO
	}

	function optionStatus() {
		// TODO
	}

	function optionSave() {
		// TODO
	}

	function optionQuit() {
		// TODO
	}
}
