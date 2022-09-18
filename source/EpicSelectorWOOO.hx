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

class EpicSelectorWOOO extends MusicBeatState {

	var unfinishedText:FlxText;

	var bloomShit:WIBloomEffect;
	var chrom:ChromaticAberrationEffect;
	var blurThisShit:TiltshiftEffect;
	var greyscale:GreyscaleEffect;
	var distort:WIDistortionEffect;

	var shaders:Array<ShaderEffect> = [];

	//Spooky ass Mystery Effects OooooOOOooo
	//var 

	//public var camFilter:FlxCamera;
    var freeplayCats:Array<String>;
	var fpCateBanners:FlxSprite;
	var grpCats:FlxTypedGroup<Alphabet>;
	var curSelected:Int = 0;
	var BG:FlxSprite;
    override function create(){

		if(ClientPrefs.language == "Spanish") {
		unfinishedText = new FlxText(907, FlxG.height - 54, 0, "Por Ahora, Esto Esta Sin Terminar, La Version Final Sera Diferente!", 25);
		unfinishedText.scrollFactor.set();
		unfinishedText.screenCenter(X);
		unfinishedText.setFormat(Paths.font("NewWaltDisneyFontRegular-BPen.ttf"), 25, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(unfinishedText);
		} else {
		unfinishedText = new FlxText(907, FlxG.height - 54, 0, "Currently, The category Menu is Unfinished, The Final Verion Will Be Different!", 25);
		unfinishedText.scrollFactor.set();
		unfinishedText.screenCenter(X);
		unfinishedText.setFormat(Paths.font("NewWaltDisneyFontRegular-BPen.ttf"), 25, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(unfinishedText);
		}

		if(ClientPrefs.funiShaders)
					{
						chrom = new ChromaticAberrationEffect();
						blurThisShit = new TiltshiftEffect(0.4, 0);
						bloomShit = new WIBloomEffect(0);
						greyscale = new GreyscaleEffect();
						//uncomment these fucking pieces of shit if you feel like testing it.

						addShader(chrom);
						addShader(blurThisShit);
						addShader(bloomShit);
						addShader(greyscale);
						//uncomment these fucking pieces of shit if you feel like testing it.

						if (chrom != null)
						chrom.setChrome(0.003);

						if (bloomShit != null)
						bloomShit.setSize(18.0);

						if(blurThisShit != null)
						blurThisShit.setBlur(0.4);
						//uncomment these fucking pieces of shit if you feel like testing it.


					}
		if(FPClientPrefs.isolatedSong == 'Completed' && FPClientPrefs.lunacySong == 'Completed' && FPClientPrefs.twistedSong == 'Completed' && FPClientPrefs.huntedLock == 'beaten' && FPClientPrefs.malfunctionLock == 'beaten' && FPClientPrefs.sinsLock == 'beaten' && FPClientPrefs.oldisolateLock == 'beaten')
		{
			if(ClientPrefs.language == "Spanish") freeplayCats = ['Jugar', 'Un Mensaje Para It', '???'];
			else freeplayCats = ['Play', 'A Letter for You', '???'];
		} else {
			if(ClientPrefs.language == "Spanish") freeplayCats = ['Play', '???', '???'];
			else freeplayCats = ['Jugar', '???', '???'];
		}		

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

        changeSelection();
        super.create();
    }

	function clearShader()
	{
		shaders = [];
		var newCamEffects:Array<BitmapFilter> = [];
		FlxG.camera.setFilters(newCamEffects);
	}

	function addShader(effect:ShaderEffect)
	{
		if (!ClientPrefs.funiShaders)
			return;

		shaders.push(effect);

		var newCamEffects:Array<BitmapFilter> = [];

		for (i in shaders)
		{
			newCamEffects.push(new ShaderFilter(i.shader));
		}

		FlxG.camera.setFilters(newCamEffects);
	}

    override public function update(elapsed:Float){
        
		if (controls.UI_UP_P) 
			changeSelection(-1);
		if (controls.UI_DOWN_P) 
			changeSelection(1);
		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
        if (controls.ACCEPT){
            switch(curSelected){
                case 0:
				//if(FPClientPrefs.episode1FPLock == 'unlocked')
				//{
					MusicBeatState.switchState(new EpisodesState());
				//}else{
				//	FlxG.sound.play(Paths.sound('cancelMenu'));
				//}
                case 1:
				if(FPClientPrefs.isolatedSong == 'Completed' && FPClientPrefs.lunacySong == 'Completed' && FPClientPrefs.twistedSong == 'Completed' && FPClientPrefs.huntedLock == 'beaten' && FPClientPrefs.malfunctionLock == 'beaten' && FPClientPrefs.sinsLock == 'beaten' && FPClientPrefs.oldisolateLock == 'beaten')
				{
					CoolUtil.browserLoad('https://twitter.com/i/status/1536165280510005250'); // Fuck you, you're going to Twitter
					//MusicBeatState.switchState(new FuckingVideo());
				}else{
					FlxG.sound.play(Paths.sound('cancelMenu'));
				}
				case 2:
					FlxG.sound.play(Paths.sound('cancelMenu'));
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

		if(curSelected == 2)
						{
							FlxG.camera.flash(FlxColor.BLACK, 0.6);
							FlxG.camera.shake(0.004, 99999999);
							if(ClientPrefs.funiShaders)
							{
							clearShader();
							chrom = new ChromaticAberrationEffect();
							blurThisShit = new TiltshiftEffect(0.6, 0);

							distort = new WIDistortionEffect(0.75, 0.25, false);
							distort.shader.working.value = [true];

							addShader(distort);
							addShader(chrom);
							addShader(blurThisShit);

								if (chrom != null)
							chrom.setChrome(0.005);

							if(blurThisShit != null)
							blurThisShit.setBlur(0.6);

							if (distort != null)
							distort.shader.working.value = [true];
							}

						}else if(curSelected == 1 && FPClientPrefs.isolatedSong != 'Completed' || FPClientPrefs.lunacySong != 'Completed' || FPClientPrefs.twistedSong != 'Completed' || FPClientPrefs.huntedLock != 'beaten' || FPClientPrefs.malfunctionLock != 'beaten' || FPClientPrefs.sinsLock != 'beaten' || FPClientPrefs.oldisolateLock != 'beaten'){
							FlxG.camera.flash(FlxColor.BLACK, 0.6);
							FlxG.camera.shake(0.004, 99999999);
							if(ClientPrefs.funiShaders)
							{
							clearShader();
							chrom = new ChromaticAberrationEffect();
							blurThisShit = new TiltshiftEffect(0.6, 0);

							distort = new WIDistortionEffect(0.75, 0.25, false);
							distort.shader.working.value = [true];

							addShader(distort);
							addShader(chrom);
							addShader(blurThisShit);

								if (chrom != null)
							chrom.setChrome(0.005);

							if(blurThisShit != null)
							blurThisShit.setBlur(0.6);

							if (distort != null)
							distort.shader.working.value = [true];
							}
						}else{
							FlxG.camera.flash(FlxColor.BLACK, 0.2);
							if(ClientPrefs.funiShaders)
							{
							clearShader();
							chrom = new ChromaticAberrationEffect();
							blurThisShit = new TiltshiftEffect(0.4, 0);
							bloomShit = new WIBloomEffect(0);
							greyscale = new GreyscaleEffect();
							//uncomment these fucking pieces of shit if you feel like testing it.

							addShader(chrom);
							addShader(blurThisShit);
							addShader(bloomShit);
							addShader(greyscale);
							//uncomment these fucking pieces of shit if you feel like testing it.

							if (chrom != null)
							chrom.setChrome(0.003);

							if (bloomShit != null)
							bloomShit.setSize(18.0);

							if(blurThisShit != null)
							blurThisShit.setBlur(0.4);
							//uncomment these fucking pieces of shit if you feel like testing it.
							}
							FlxG.camera.shake(0.004, 0);
						}
	}
}
