package objects;

class OptionWindow
{
    public function new()
    {
        addComponent(new PanelComponent());
        addComponent(new OptionComponent());
    }
}