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

	var disclaimText:FlxText;
	var scratchStuff:BGSprite;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite();
		bg.loadGraphic(Paths.image('funkinAVI/WARNING/Avi_Disclaimer'), false);
		bg.screenCenter();
		add(bg);

		var redFormat = new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED, true, true), '^');

		disclaimText = new FlxText(0, 0, FlxG.width,
			"DISCLAIMER:\n
			Mickey Mouse is a character owned by Disney!\n
			Flashing Lights are also turned on and CANNOT be disabled.\n
			Press ENTER to continue further to the game.\n
			Press ESCAPE to exit now.\n
			^LAST CHANCE...^",
			32);
		disclaimText.setFormat(Paths.font("NewWaltDisneyFontRegular-BPen.ttf"), 32, FlxColor.WHITE, CENTER);
		disclaimText.screenCenter(Y);
		disclaimText.applyMarkup(disclaimText.text, [redFormat]);
		add(disclaimText);
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
					FlxG.sound.play(Paths.sound('funkinAVI/warning/continue'));
					FlxFlicker.flicker(disclaimText, 1, 0.1, false, true, function(flk:FlxFlicker) {
						new FlxTimer().start(0.5, function (tmr:FlxTimer) {
							MusicBeatState.switchState(new TitleState());
						});
					});
				} else {
					ClientPrefs.flashing = false;
					System.exit(0);
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(disclaimText, {alpha: 0}, 1, {
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
