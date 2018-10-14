package ui;

class CommandWindow extends Window
{
    /**
        Create a new command window. Height adjusts itself to fit the commands.

        @param x x-coordinate of the window in pixels
        @param y y-coordinate of the window in pixels
        @param width width of the window in pixels
    **/
    public function new(x:Int, y:Int, width:Int)
    {
        super(x, y, width, 32);
    }

    /**
        This function adds a command to the list of commands of this window.

        @param text    the shown text of the command
        @param command the function that is executed when the command is selected
    **/
    public function addCommand(text:String, command:Void->Void)
    {
        
    }
}