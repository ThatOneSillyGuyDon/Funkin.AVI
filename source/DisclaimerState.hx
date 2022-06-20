package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flash.system.System;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class DisclaimerState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var blackFade:FlxSprite;
	var dumbBG:FlxSprite;
	var disclaimText:FlxText;
	var disclaimText2:FlxText;
	var disclaimText3:FlxText;
	override function create()
	{
		super.create();

		dumbBG = new FlxSprite();
		dumbBG.loadGraphic(Paths.image('WARNING/Avi_Disclaimer'), false);
		dumbBG.screenCenter();
		dumbBG.scale.x = 0.68;
		dumbBG.scale.y = 0.67;
		add(dumbBG);

		var redFormat = new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED, true, true), '^');

		disclaimText = new FlxText(20, 40, FlxG.width,
			"DISCLAIMER:",
			64);
		disclaimText.setFormat(Paths.font("NewWaltDisneyFontRegular-BPen.ttf"), 64, FlxColor.WHITE, LEFT);
		add(disclaimText);

		disclaimText2 = new FlxText(15, 150, FlxG.width,
			"Mickey Mouse is a character owned by Disney!\n
			Flashing Lights are in this mod so Be careful.\n
			Press ENTER to continue further to the game and disable it.\n
			Press ESCAPE to exit now.",
			20);
		disclaimText2.setFormat(Paths.font("NewWaltDisneyFontRegular-BPen.ttf"), 32, FlxColor.WHITE, LEFT);
		add(disclaimText2);

		disclaimText3 = new FlxText(15, 480, FlxG.width,
			"^LAST CHANCE...^",
			74);
		disclaimText3.setFormat(Paths.font("NewWaltDisneyFontRegular-BPen.ttf"), 74, FlxColor.WHITE, LEFT);
		disclaimText3.applyMarkup(disclaimText3.text, [redFormat]);
		add(disclaimText3);

		blackFade = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(blackFade);

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

		FlxTween.tween(blackFade, {alpha: 0}, 1);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			var back:Bool = controls.BACK;
			if (controls.ACCEPT || back) {
				leftState = true;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				if(!back) {
					ClientPrefs.flashing = false;
					ClientPrefs.saveSettings();
					FlxG.sound.play(Paths.sound('funkinAVI/menu/select_sfx'));
					FlxTween.tween(blackFade, {alpha: 1}, 1, {
						onComplete: function (twn:FlxTween) {
							MusicBeatState.switchState(new TitleState());
						}
					});
				} else {
					ClientPrefs.flashing = true;
					System.exit(0);
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(blackFade, {alpha: 1}, 1, {
						onComplete: function (twn:FlxTween) {
							MusicBeatState.switchState(new TitleState());
						}
					});
				}
			}
		}
		super.update(elapsed);
	}
}
