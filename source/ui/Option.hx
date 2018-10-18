package ui;

/**
    An option consists of a string (the text) and a function that is executed when the option is chosen.
**/
class Option
{
    /**
        The text that is shown in the option window.
    **/
    public var text:String;

    var execute:Void->Void;

    public function new(text:String, execute:Void->Void)
    {
        this.text = text;
        this.execute = execute;
    }
}