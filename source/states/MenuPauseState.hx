package states;

import components.OptionListComponent;
import components.PanelComponent;
import flixel.FlxG;
import flixel.math.FlxPoint;
import objects.OptionWindow;

class MenuPauseState extends State
{
    static inline var MENU_X = 224;

    override public function create()
    {
        super.create();

        var menu = new OptionWindow(uiLayer);
        menu.position = new FlxPoint(MENU_X, 0);

        var menuPanel = cast(menu.getComponent(PanelComponent), PanelComponent);
        menuPanel.size = new FlxPoint(Main.SCREEN_WIDTH - MENU_X, 128);

        var menuOption = cast(menu.getComponent(OptionListComponent), OptionListComponent);
        menuOption.options.push(new Option("Inventory", optionInventory));
        menuOption.options.push(new Option("Equipment", optionEquipment));
        menuOption.options.push(new Option("Status", optionStatus));
        menuOption.options.push(new Option("Save", optionSave));
        menuOption.options.push(new Option("Quit", optionQuit));
        menuOption.cancel = close;

        gameObjects.push(menu);

        start();
    }

    function optionInventory()
    {}

    function optionEquipment()
    {}

    function optionStatus()
    {}

    function optionSave()
    {}

    function optionQuit()
    {}
}