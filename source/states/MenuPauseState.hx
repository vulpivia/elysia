package states;

import ui.Option;
import ui.OptionWindow;

class MenuPauseState extends State
{
    function optionInventory()
    {
        // TODO
    }

    function optionSkills()
    {
        // TODO
    }

    function optionEquipment()
    {
        // TODO
    }

    function optionStatus()
    {
        // TODO
    }

    function optionSettings()
    {
        // TODO
    }

    function optionQuit()
    {
        // TODO
    }

    function createOptionWindow()
    {
        var optionWindow = new OptionWindow(0, 0, 128);
        optionWindow.addOption(new Option("Inventory", optionInventory));
        optionWindow.addOption(new Option("Skills", optionSkills));
        optionWindow.addOption(new Option("Equipment", optionEquipment));
        optionWindow.addOption(new Option("Status", optionStatus));
        optionWindow.addOption(new Option("Settings", optionSettings));
        optionWindow.addOption(new Option("Quit", optionQuit));
    }

    override public function create()
    {
        createOptionWindow();

        super.create();
    }
}