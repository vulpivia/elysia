package commands;

import entities.Character;
import flash.geom.Rectangle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.text.FlxText;
import maps.Map;
import states.State;

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
        Width of the bubble in pixels.
    **/
    static inline var BUBBLE_WIDTH:Int = 128;
    /**
        Height of the bubble in pixels.
    **/
    static inline var BUBBLE_HEIGHT:Int = 32;

    static inline var BUBBLE_OFFSET_Y:Int = -36;

    static inline var BUBBLE_BOTTOM_OFFSET_X:Int = -6;
    static inline var BUBBLE_BOTTOM_OFFSET_Y:Int = -2;

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
            var x = character.x - BUBBLE_WIDTH / 2 + Map.TILE_SIZE / 2 + BUBBLE_PADDING;
            var y = character.y - BUBBLE_HEIGHT / 2 + BUBBLE_OFFSET_Y + BUBBLE_PADDING;
            var width = BUBBLE_WIDTH - BUBBLE_PADDING * 2;
            this.text = new FlxText(x, y, width, "");
        }
    }

    override public function create(state:State)
    {
        super.create(state);

        if (this.character != null)
        {
            var slicePoints = [SLICE_A_X, SLICE_A_Y, SLICE_B_X, SLICE_B_Y];
            var size = new Rectangle(0, 0, BUBBLE_WIDTH, BUBBLE_HEIGHT);

            var bubbleX = character.x - BUBBLE_WIDTH / 2 + Map.TILE_SIZE / 2;
            var bubbleY = character.y - BUBBLE_HEIGHT / 2 + BUBBLE_OFFSET_Y;
            sprite = new FlxUI9SliceSprite(bubbleX, bubbleY, AssetPaths.tileset_message__png, size, slicePoints);

            var bubbleBottomX = character.x + BUBBLE_BOTTOM_OFFSET_X + Map.TILE_SIZE / 2;
            var bubbleBottomY = character.y + BUBBLE_HEIGHT / 2 + BUBBLE_BOTTOM_OFFSET_Y + BUBBLE_OFFSET_Y;
            spriteBottom = new FlxSprite(bubbleBottomX, bubbleBottomY, AssetPaths.sprite_message_bottom__png);
        }
    }

    function initialUpdate()
    {
        if (this.character != null)
        {
            state.uiLayer.add(sprite);
            state.uiLayer.add(spriteBottom);
        }

        state.uiLayer.add(text);

        FlxG.camera.follow(character.sprite);

        firstUpdate = false;
    }

    function finishedTextUpdate()
    {
        if (FlxG.keys.justPressed.ENTER)
        {
            if (sprite != null)
            {
                FlxG.camera.follow(Game.player.sprite);

                sprite.destroy();
                spriteBottom.destroy();
            }
            text.destroy();
            finish();
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
            initialUpdate();
            return;
        }

        var textString = text.text;

        if (textString == fullText)
        {
            // Text fully loaded
            finishedTextUpdate();
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