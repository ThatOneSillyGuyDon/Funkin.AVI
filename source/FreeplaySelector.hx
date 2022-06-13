// i'mma have the songs separate in 2 different menus from here
package;

#if desktop
import Discord.DiscordClient;
#end
import editors.ChartingState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import WeekData;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;
//just a copy from FreeplayState lol
//also borrowed from demolition engine code LMAO

class FreeplaySelector extends MusicBeatState
{
        var episodie1:FlxSprite;
        var epsidodie2:FlxSprite;
        var episodie3:FlxSprite;
        var final:FlxSprite;
        var selectorBox:FlxSprite;
        var randomWindowText:Int = FlxG.random.int(0, 20);
  
        var bg:FlxSprite;
	      public var camZooming:Bool = false;
  
        override function create()
      	{
                Paths.clearStoredMemory();
		            Paths.clearUnusedMemory();
		
		            persistentUpdate = true;

		            #if desktop
		            // Updating Discord Rich Presence
		            DiscordClient.changePresence("In Freeplay Category", null);
		            #end
                  
                bg = new FlxSprite().loadGraphic(Paths.image('menuFreeplayCate'));
	        	bg.antialiasing = ClientPrefs.globalAntialiasing;
                bg.color = 0xFF424d54;
		add(bg);
		bg.screenCenter();
          
                exclusiveShit = new FlxSprite().loadGraphic(Paths.image('bonusBanner'));
                exclusiveShit.antialiasing = ClientPrefs.globalAntialiasing;
                add(exclusiveShit);
          
                modsMusic = new FlxSprite().loadGraphic(Paths.image('modsMenuBanner'));
                modsMusic.antialiasing = ClientPrefs.globalAntialiasing;
                add(modsMusic);
          	
		vanillaGame = new FlxSprite().loadGraphic(Paths.image('mainGameBanner'));
                vanillaGame.antialiasing = ClientPrefs.globalAntialiasing;
                add(vanillaGame);
		
                selectorBox = new FlxSprite().loadGraphic(Paths.image('daSelecta'));
                selectorBox.antialiasing = ClientPrefs.globalAntialiasing;
                add(selectorBox);
          
                super.create();
                switch randomWindowText {
                    case 0:
                    Application.current.window.title = "Funkin.avi Is Trying To Hack Your Computer";
                    case 1:
                    Application.current.window.title = "Funkin.avi - Wow Freeplay categories, interesting";
                    case 2:
                    Application.current.window.title = "Funkin.avi - P I S S";
                    case 3:
                    Application.current.window.title = "Funkin.avi - shipy if you collab with our mod that would be epic";
                    case 4:
                    Application.current.window.title = "Funkin.avi - A M O N G  U S";
                    case 5:
                    Application.current.window.title = "Funkin.avi - Munkey.mp4 and Sunky.mpeg are on a car ride, this is canon.";
                    case 6:
                    Application.current.window.title = "01010110100101010100100101010101010100101001010101100110001010101";
                    case 7:
                    Application.current.window.title = "Funkin.avi - omfg, stop asking, just wait for full release >:(";
                    case 8:
                    Application.current.window.title = "Sunday Night Suicide But Better";
                    case 9:
                    Application.current.window.title = "Funkin.avi - We don't talk about SNS (or yes, idk)";
                    case 10:
                    Application.current.window.title = "Funkin.avi - Sdfu, I'm hating Gacha Life";
                    case 11:
                    Application.current.window.title = "Funkin.avi - Sdfu, Jsa010 is On school";
                    case 12:
                    Application.current.window.title = "Funkin.avi - PLS DON'T LEAK OUR BUILD PLEASEEEEEEEEEEEEEEEE";
                    case 13:
                    Application.current.window.title = "Funkin.avi - Wow Bro i just discovered mayze/star did psych engine popular";
                    case 14:
                    Application.current.window.title = "Funkin.avi - Muckney.mp4, my beloved";
                    case 15:
                    Application.current.window.title = "Funkin.avi - We did it, YES";
                    case 16:
                    Application.current.window.title = "Funkin.avi - ur adopted yay";
                    case 17:
                    Application.current.window.title = "Funkin.avi - MOUSE RAP. MOUSE RAP";
                    case 18:
                    Application.current.window.title = "RIP YOUR COMPUTER HAHHHHHAHAHAHAHAHAHAHAHAHAHHAHAH";
                    new FlxTimer().start(1.5, function(tmr:FlxTimer){
                        System.exit(0);
                    });
                    case 19:
                    Application.current.window.title = "Funkin.avi - Minnie dead, its your faud idiot";
                    case 20:
                    Application.current.window.title = "Funkin.avi - Yo in credits";
        }
}
//We workin' on this, clearly not finished lmao