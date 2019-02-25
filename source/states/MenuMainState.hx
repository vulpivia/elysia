package states;

import components.OptionListComponent;
import components.PanelComponent;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import lime.system.System;
import maps.LaboratoryMap;
import objects.OptionWindow;

/**
    The main menu. This is the first state of the game.
**/
class MenuMainState extends State
{
    override public function create()
    {
        super.create();

        backgroundLayer.add(new FlxSprite(0, 0, AssetPaths.background_title__png));

        var mainMenu = new OptionWindow(uiLayer);
        mainMenu.position = new FlxPoint(96, 144);

        var mainMenuPanel = cast(mainMenu.getComponent(PanelComponent), PanelComponent);
        mainMenuPanel.size = new FlxPoint(128, OptionListComponent.LINE_HEIGHT * 3 + 14);

        var mainMenuOption = cast(mainMenu.getComponent(OptionListComponent), OptionListComponent);
        mainMenuOption.options.push(new Option("New Game", optionNewGame));
        mainMenuOption.options.push(new Option("Continue", optionContinue));
        mainMenuOption.options.push(new Option("Shutdown", optionShutdown));

        gameObjects.push(mainMenu);

        start();
    }

    function optionNewGame()
    {
        GameState.initialize();

        RootState.state.closeSubState();
        RootState.state.openSubState(new ExplorationState(LaboratoryMap, 10, 9));
    }

    function optionContinue()
    {}

    function optionShutdown()
    {
        System.exit(0);
    }
}