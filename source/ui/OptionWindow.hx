package ui;

class OptionWindow extends Window
{
    /**
        Create a new option window. Height adjusts itself to fit the options.

        @param x x-coordinate of the window in pixels
        @param y y-coordinate of the window in pixels
        @param width width of the window in pixels
    **/
    public function new(state:FlxState, x:Int, y:Int, width:Int)
    {
        super(state, x, y, width, 32);
    }

    /**
        This function adds an option to the list of options of this window.

        @param text the shown text of the command
        @param option the function that is executed when the command is selected
    **/
    public function addOption(text:String, option:Void->Void)
    {
        
    }
}