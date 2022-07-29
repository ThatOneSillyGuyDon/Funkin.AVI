package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import lime.app.Application;

using StringTools;

class Stupid Shitty New Freeplay Category Example extends MusicBeatState
{
      var BG:FlxSprite;
      var tag1:FlxSprite;
      var tag2:FlxSprite;

      private var camGame:FlxCamera;

      override function create()
      {
            FlxG.mouse.visible = true;

            camGame = new FlxCamera();
            FlxG.cameras.reset(camGame);
            FlxCamera.defaultCameras = [camGame];

            transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In Freeplay", "Category Menu", null, 'icon');
		#end

            Application.current.window.title = "Funkin.avi - Freeplay: Category Menu";

            BG = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		BG.updateHitbox();
		BG.screenCenter();
		add(BG);

            tag1 = new FlxSprite().loadGraphic(Paths.image('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB'));
            tag1.updateHitbox();
            tag1.antialiasing = ClientPrefs.globalAntialiasing;
            tag1.screenCenter(Y);
            tag1.x -= 100; //IDK
            add(tag1);

            tag2 = new FlxSprite().loadGraphic(Paths.image('Mickey_Mouse_South_Park'));
            tag2.updateHitbox();
            tag2.antialiasing = ClientPrefs.globalAntialiasing;
            tag2.screenCenter(Y);
            tag2.x += 100; //IDK
            add(tag1);

            super.create();
      }

      var selectedSomethin:Bool = false;

      override function update(elapsed:Float)
            {
                  if (FlxG.sound.music.volume < 0.8)
                  {
                        FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
                        if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
                  }

                  if (!selectedSomethin)
                        {
                              if (controls.BACK)
                              {
                                    selectedSomethin = true;
                                    FlxG.sound.play(Paths.sound('cancelMenu'));
                                    MusicBeatState.switchState(new THE_SUPER_COOL_EPIC_MENU_State());
                              }

                              if(FlxG.mouse.overlaps(tag1) && FlxG.mouse.justPressed){
                                    MusicBeatState.switchState(new EpisodesState());
                                    selectedSomethin = true;
                                    FlxG.sound.play(Paths.sound('confirmMenu'));
                              }

                              if(FlxG.mouse.overlaps(tag1) && FlxG.mouse.justPressed){
                                    MusicBeatState.switchState(new ExtrasState());
                                    selectedSomethin = true;
                                    FlxG.sound.play(Paths.sound('confirmMenu'));
                              }
                        }
                        super.update(elapsed);
            }
}