package ui;

class Option
{
    private var text:String;
    private var execute:Void->Void;

    public function new(text:String, execute:Void->Void)
    {
        this.text = text;
        this.execute = execute;
    }
}