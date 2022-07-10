package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import PlayState;
import Shaders;
import openfl.display.BlendMode;
import openfl.display.StageQuality;
import openfl.filters.BitmapFilter;
import openfl.utils.Assets as OpenFlAssets;
import openfl.filters.ShaderFilter;

using StringTools;

class EpicSelectorWOOO extends MusicBeatState{
	public var camFilter:FlxCamera;
    var freeplayCats:Array<String> = ['Episodes', 'Extras'];
	var fpCateBanners:FlxSprite;
	var grpCats:FlxTypedGroup<Alphabet>;
	var curSelected:Int = 0;
	var BG:FlxSprite;
    override function create(){

		camFilter = new FlxCamera();
		camFilter.bgColor.alpha = 0;

		FlxG.cameras.add(camFilter);

        BG = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		BG.updateHitbox();
		BG.screenCenter();
		add(BG);

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In Freeplay", "Category Menu", null, 'icon');
		#end

		Application.current.window.title = "Funkin.avi - Freeplay: Category Menu";

        grpCats = new FlxTypedGroup<Alphabet>();
		add(grpCats);
        for (i in 0...freeplayCats.length)
        {
			var catsText:Alphabet = new Alphabet(0, (70 * i) + 30, freeplayCats[i], true, false);
            catsText.targetY = i;
            catsText.isMenuItemCenter = true;
			grpCats.add(catsText);
		}

		var scratchStuff:FlxSprite = new FlxSprite();
		scratchStuff.frames = Paths.getSparrowAtlas('funkinAVI-filters/scratchShit');
		scratchStuff.animation.addByPrefix('idle', 'scratch thing 1', 24, true);
		scratchStuff.animation.play('idle');
		scratchStuff.screenCenter();
		scratchStuff.scale.x = 1.1;
		scratchStuff.scale.y = 1.1;
		add(scratchStuff);

		var grain:FlxSprite = new FlxSprite();
		grain.frames = Paths.getSparrowAtlas('funkinAVI-filters/Grainshit');
		grain.animation.addByPrefix('idle', 'grains 1', 24, true);
		grain.animation.play('idle');
		grain.screenCenter();
		grain.scale.x = 1.1;
		grain.scale.y = 1.1;
		add(grain);

		scratchStuff.cameras = [camFilter];
		grain.cameras = [camFilter];

		/*if(ClientPrefs.funiShaders)
		{
			//Epic Shaders Let's GOOOOOOOOO
			PlayState.instance.addShaderToCamera('filter', new ChromaticAberrationEffect(0.005));
			PlayState.instance.addShaderToCamera('filter', new VCRDistortionEffect(0, true, false, true));
			PlayState.instance.addShaderToCamera('filter', new VhsEffect(0.3, 0));
			PlayState.instance.addShaderToCamera('filter', new TiltshiftEffect(0.5, 0));
		}*/

        changeSelection();
        super.create();
    }

    override public function update(elapsed:Float){
        
		if (controls.UI_UP_P) 
			changeSelection(-1);
		if (controls.UI_DOWN_P) 
			changeSelection(1);
		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			if(ClientPrefs.simpleMenu) {
			MusicBeatState.switchState(new LowEndMenuState());
			}else{
				MusicBeatState.switchState(new MainMenuState());
			}
		}
        if (controls.ACCEPT){
            switch(curSelected){
                case 0:
                MusicBeatState.switchState(new EpisodesState());
                case 1:
                MusicBeatState.switchState(new ExtrasState());
            }
        }
        super.update(elapsed);
    }

    function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = freeplayCats.length - 1;
		if (curSelected >= freeplayCats.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpCats.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
			}
		}
		FlxG.sound.play(Paths.sound('funkinAVI/menu/scroll_sfx'));
	}
}
