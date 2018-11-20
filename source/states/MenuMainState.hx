package states;

import components.OptionComponent;
import components.PanelComponent;
import flixel.math.FlxPoint;
import objects.GameObject;
import objects.OptionWindow;

/**
    The main menu. This is the first state of the game.
**/
class MenuMainState extends State
{
    var mainMenu:GameObject;

    override public function create()
    {
        super.create();

        mainMenu = new OptionWindow(uiLayer);
        mainMenu.position = new FlxPoint(96, 144);

        var mainMenuPanel = cast(mainMenu.getComponent(PanelComponent), PanelComponent);
        mainMenuPanel.size = new FlxPoint(128, 16);

        var mainMenuOption = cast(mainMenu.getComponent(OptionComponent), OptionComponent);
        mainMenuOption.options.push(new Option("New Game", optionNewGame));
        mainMenuOption.options.push(new Option("Continue", optionContinue));
        mainMenuOption.options.push(new Option("Shutdown", optionShutdown));

        mainMenu.start();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        mainMenu.update();
    }

    function optionNewGame()
    {}

    function optionContinue()
    {}

    function optionShutdown()
    {}

    /*static inline var MAIN_MENU_WINDOW_X:Int = 96;
    static inline var MAIN_MENU_WINDOW_Y:Int = 144;
    static inline var MAIN_MENU_WINDOW_WIDTH:Int = 128;

    var optionWindow:OptionWindow;

    function createBackground()
    {
        var background = new FlxSprite();
        background.loadGraphic(AssetPaths.background_title__png);
        backgroundLayer.add(background);
    }

    function createOptionWindow()
    {
        optionWindow = new OptionWindow(MAIN_MENU_WINDOW_X, MAIN_MENU_WINDOW_Y, MAIN_MENU_WINDOW_WIDTH);
        optionWindow.addOption(new Option("New Game", optionNewGame));
        optionWindow.addOption(new Option("Continue", optionContinue));
        optionWindow.addOption(new Option("Shutdown", optionShutdown));
    }

    function optionNewGame()
    {
        FlxG.switchState(new ExplorationState(LaboratoryMap));
    }

    function optionContinue()
    {
        FlxG.switchState(new MenuLoadState());
    }

    function optionShutdown()
    {
        System.exit(0);
    }

    override public function create()
    {
        createBackground();
        createOptionWindow();

        super.create();
    }*/
}