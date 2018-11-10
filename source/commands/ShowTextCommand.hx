package commands;

import entities.Character;
import flash.geom.Rectangle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.text.FlxText;

/**
    Opens a message window and displays text.
**/
class ShowTextCommand extends Command
{
    /**
        Distance between screen border and text in pixels.
    **/
    static inline var SCREEN_PADDING:Int = 16;

    /**
        Distance between bubble border and text in pixels.
    **/
    static inline var BUBBLE_PADDING:Int = 4;
    /**
        Distance between screen border and bubble border in pixels.
    **/
    static inline var BUBBLE_SCREEN_PADDING:Int = 64;
    /**
        Height of the bubble in pixels.
    **/
    static inline var BUBBLE_HEIGHT:Int = 32;

    static inline var BUBBLE_BOTTOM_OFFSET_X:Int = 6;
    static inline var BUBBLE_BOTTOM_OFFSET_Y:Int = 6;

    static inline var SLICE_A_X:Int = 8;
    static inline var SLICE_A_Y:Int = 8;
    static inline var SLICE_B_X:Int = 16;
    static inline var SLICE_B_Y:Int = 16;

    var text:FlxText;
    var fullText:String;
    var character:Character;
    var sprite:FlxUI9SliceSprite;
    var spriteBottom:FlxSprite;

    var firstUpdate:Bool;

    /**
        Opens a message window and displays text.

        @param character The character that says the text.
        @param text The content of the message window.
    **/
    public function new(character:Character, text:String)
    {
        super();
        fullText = text;
        this.character = character;

        firstUpdate = true;

        if (character == null)
        {
            this.text = new FlxText(SCREEN_PADDING, SCREEN_PADDING, Game.SCREEN_WIDTH - SCREEN_PADDING * 2, "");
        }
        else
        {
            this.text = new FlxText(BUBBLE_SCREEN_PADDING, BUBBLE_SCREEN_PADDING, Game.SCREEN_WIDTH - BUBBLE_SCREEN_PADDING * 2, "");
        }
    }

    override public function create(state:FlxState)
    {
        super.create(state);

        if (this.character != null)
        {
            var slicePoints = [SLICE_A_X, SLICE_A_Y, SLICE_B_X, SLICE_B_Y];
            var size = new Rectangle(0, 0, Game.SCREEN_WIDTH - BUBBLE_SCREEN_PADDING * 2 + BUBBLE_PADDING * 2, BUBBLE_HEIGHT);

            var bubbleX = BUBBLE_SCREEN_PADDING - BUBBLE_PADDING;
            var bubbleY = BUBBLE_SCREEN_PADDING - BUBBLE_PADDING;
            sprite = new FlxUI9SliceSprite(bubbleX, bubbleY, AssetPaths.tileset_message__png, size, slicePoints);

            var bubbleBottomX = Game.SCREEN_WIDTH / 2 - BUBBLE_BOTTOM_OFFSET_X;
            var bubbleBottomY = BUBBLE_SCREEN_PADDING + BUBBLE_HEIGHT - BUBBLE_BOTTOM_OFFSET_Y;
            spriteBottom = new FlxSprite(bubbleBottomX, bubbleBottomY, AssetPaths.sprite_message_bottom__png);
        }
    }

    override public function update()
    {
        if (!executing)
        {
            return;
        }

        if (firstUpdate)
        {
            if (this.character != null)
            {
                state.add(sprite);
                state.add(spriteBottom);
            }

            state.add(text);

            firstUpdate = false;
            return;
        }

        var textString = text.text;
        if (textString == fullText)
        {
            if (FlxG.keys.justPressed.ENTER)
            {
                if (sprite != null)
                {
                    sprite.destroy();
                    spriteBottom.destroy();
                }
                text.destroy();
                finish();
            }
            return;
        }

        if (FlxG.keys.justPressed.ENTER)
        {
            textString = fullText;
        }
        else
        {
            textString += fullText.charAt(textString.length);
        }

        text.text = textString;
    }
}