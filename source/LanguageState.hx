package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flash.system.System;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class LanguageState extends MusicBeatState
{
	public static var languageSelected:Bool = false;

	var warnText:FlxText;
	var otherText:FlxText;
	var spanish:FlxSprite;
	var english:FlxSprite;
	override function create()
	{
		super.create();

        FlxG.mouse.visible = true;

	
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
		"What Language Do You Talk?/De Que Lenguage hablas?",
			32);
		warnText.setFormat(Paths.font("NewWaltDisneyFontRegular-BPen.ttf"), 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(X);
		add(warnText);

        	otherText = new FlxText(0, 40, FlxG.width,
            	"(Puede Ser Cambiado En Opciones/it Can be Changed In Options)",
                32);
            	otherText.setFormat(Paths.font("NewWaltDisneyFontRegular-BPen.ttf"), 32, FlxColor.WHITE, CENTER);
            	otherText.screenCenter(X);
            	add(otherText);

                spanish = new FlxSprite().loadGraphic(Paths.image('language/Spanish'));
                spanish.screenCenter(Y);
                spanish.antialiasing = ClientPrefs.globalAntialiasing;
                spanish.x = 250;
                add(spanish);

                english = new FlxSprite().loadGraphic(Paths.image('language/English'));
                english.screenCenter(Y);
                spanish.antialiasing = ClientPrefs.globalAntialiasing;
                english.x = 750;
                add(english);

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
	}

	override function update(elapsed:Float)
	{
		if(!languageSelected) {
			
			var back:Bool = controls.BACK;
			if (controls.ACCEPT || back) {
				languageSelected = true;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
			//ik, copied from FlashingState, but it works either way, this is to prevent the transition state from triggering
				
				if(FlxG.mouse.overlaps(spanish) && FlxG.mouse.justPressed) {
					ClientPrefs.language = "Spanish";
					FlxG.sound.play(Paths.sound('funkinAVI/menu/select_sfx'));
					ClientPrefs.saveSettings();
					FlxTween.tween(otherText, {alpha: 0}, 1);
					FlxTween.tween(english, {alpha: 0}, 0.2);
					FlxTween.tween(warnText, {alpha: 0}, 1);
					FlxTween.tween(spanish, {alpha: 0}, 2.5, {
						onComplete: function (twn:FlxTween) {
							MusicBeatState.switchState(new FlashingState());
						}
					});
					languageSelected = true;
				} else {
				if(FlxG.mouse.overlaps(english) && FlxG.mouse.justPressed) {
					ClientPrefs.language = "English";
					FlxG.sound.play(Paths.sound('funkinAVI/menu/select_sfx'));
                   			ClientPrefs.saveSettings();
					FlxTween.tween(otherText, {alpha: 0}, 1);
					FlxTween.tween(spanish, {alpha: 0}, 0.2);
					FlxTween.tween(warnText, {alpha: 0}, 1);
					FlxTween.tween(english, {alpha: 0}, 2.5, {
						onComplete: function (twn:FlxTween) {
							MusicBeatState.switchState(new FlashingState());
						}
					});
			    		languageSelected = true;
				}
			}
		super.update(elapsed);
	}
}
}
