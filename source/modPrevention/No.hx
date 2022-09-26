package modPrevention;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import lime.app.Application;
import flash.system.System;

class No extends FlxState
{
	override public function create()
	{
		super.create();
        FlxG.sound.play(Paths.sound('wiiCrash'), 1.8);
        Application.current.window.alert('Never EVER, try to modify the contents of Funkin.avi Again...');
        System.exit(0);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
        FlxG.sound.play(Paths.sound('wiiCrash'), 1.8);
        Application.current.window.alert('Never EVER, try to modify the contents of Funkin.avi Again...');
        System.exit(0);
	}
}