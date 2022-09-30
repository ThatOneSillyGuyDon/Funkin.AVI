package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import Conductor;

class NoteSplash extends FlxSprite
{
	public var colorSwap:ColorSwap = null;
	private var idleAnim:String;
	private var textureLoaded:String = null;
	public static var windowNames:Array<String> = Conductor.windowNames;

	public function new(x:Float = 0, y:Float = 0, ?note:Int = 0) {
		super(x, y);

		switch(PlayState.curStage)
		{
			case 'RelapseStage':
				var skin:String = 'NoteSplashSkins/GREYnoteSplashes';
				if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) skin = PlayState.SONG.splashSkin;

				loadAnims(skin);
				
				colorSwap = new ColorSwap();
				shader = colorSwap.shader;

				setupNoteSplash(x, y, note);
				antialiasing = ClientPrefs.globalAntialiasing;
			case 'WaltStage':
				var skin:String = 'NoteSplashSkins/waltSplashes';
				if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) skin = PlayState.SONG.splashSkin;

				loadAnims(skin);
				
				colorSwap = new ColorSwap();
				shader = colorSwap.shader;

				setupNoteSplash(x, y, note);
				antialiasing = ClientPrefs.globalAntialiasing;
			case 'Studio' | 'Forest' | 'EndlessLoop' | 'ForestNEW' | 'Office':
				var skin:String = 'NoteSplashSkins/noteSplashesGREY';
				if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) skin = PlayState.SONG.splashSkin;

				loadAnims(skin);
				
				colorSwap = new ColorSwap();
				shader = colorSwap.shader;

				setupNoteSplash(x, y, note);
				antialiasing = ClientPrefs.globalAntialiasing;
			default:
				var skin:String = 'NoteSplashSkins/NOTE_splashes-Better';
				if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) skin = PlayState.SONG.splashSkin;

				loadAnims(skin);
				
				colorSwap = new ColorSwap();
				shader = colorSwap.shader;

				setupNoteSplash(x, y, note);
				antialiasing = ClientPrefs.globalAntialiasing;
		}
	}

	public function setupNoteSplash(x:Float, y:Float, note:Int = 0, judge:Array<String> = null, texture:String = null, hueColor:Float = 0, satColor:Float = 0, brtColor:Float = 0) {
		setPosition(x - Note.swagWidth * 0.95, y - Note.swagWidth);
		alpha = 0.6;

		switch(PlayState.curStage)
		{
			case 'RelapseStage':
				if(texture == null) {
				texture = 'NoteSplashSkins/GREYnoteSplashes';
				if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) texture = PlayState.SONG.splashSkin;

				if(PlayState.isPixelStage) {
					texture = 'pixelUI/GREYnoteSplashes';
					if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) texture = 'pixelUI/' + PlayState.SONG.splashSkin;
					if(animation.curAnim != null)animation.curAnim.frameRate = 12;
				}
			}
			case 'WaltStage':
				if(texture == null) {
				texture = 'NoteSplashSkins/waltSplashes';
				if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) texture = PlayState.SONG.splashSkin;

				if(PlayState.isPixelStage) {
					texture = 'pixelUI/noteSplashes';
					if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) texture = 'pixelUI/' + PlayState.SONG.splashSkin;
					if(animation.curAnim != null)animation.curAnim.frameRate = 12;
				}
			}
			case 'Studio' | 'Forest' | 'EndlessLoop' | 'ForestNEW' | 'Office':
				if(texture == null) {
				texture = 'NoteSplashSkins/noteSplashesGREY';
				if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) texture = PlayState.SONG.splashSkin;

				if(PlayState.isPixelStage) {
					texture = 'pixelUI/noteSplashes';
					if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) texture = 'pixelUI/' + PlayState.SONG.splashSkin;
					if(animation.curAnim != null)animation.curAnim.frameRate = 12;
				}
			}
			default:
				if(texture == null) {
				texture = 'NoteSplashSkins/NOTE_splashes-Better';
				if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) texture = PlayState.SONG.splashSkin;

				if(PlayState.isPixelStage) {
					texture = 'pixelUI/noteSplashes';
					if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0) texture = 'pixelUI/' + PlayState.SONG.splashSkin;
					if(animation.curAnim != null)animation.curAnim.frameRate = 12;
				}
			}
		}

		if(textureLoaded != texture) {
			loadAnims(texture);
		}
		colorSwap.hue = hueColor;
		colorSwap.saturation = satColor;
		colorSwap.brightness = brtColor;
		offset.set(10, 10);

		var animNum:Int = FlxG.random.int(1, 2);
		animation.play(judge + '-note' + note + '-' + animNum, true);
		if(animation.curAnim != null)animation.curAnim.frameRate = 24 + FlxG.random.int(-2, 2);
	}

	function loadAnims(skin:String) {
		frames = Paths.getSparrowAtlas(skin);
		for (i in 1...3) {
			animation.addByPrefix("good-note1-" + i, "note splash blue " + i, 24, false);
			animation.addByPrefix("good-note2-" + i, "note splash green " + i, 24, false);
			animation.addByPrefix("good-note0-" + i, "note splash purple " + i, 24, false);
			animation.addByPrefix("good-note3-" + i, "note splash red " + i, 24, false);
			animation.addByPrefix("sick-note1-" + i, "note splash diamond blue " + i, 24, false);
			animation.addByPrefix("sick-note2-" + i, "note splash diamond green " + i, 24, false);
			animation.addByPrefix("sick-note0-" + i, "note splash diamond purple " + i, 24, false);
			animation.addByPrefix("sick-note3-" + i, "note splash diamond red " + i, 24, false);
			animation.addByPrefix("marvelous-note1-" + i, "note splash sparkle blue " + i, 24, false);
			animation.addByPrefix("marvelous-note2-" + i, "note splash sparkle green " + i, 24, false);
			animation.addByPrefix("marvelous-note0-" + i, "note splash sparkle purple " + i, 24, false);
			animation.addByPrefix("marvelous-note3-" + i, "note splash sparkle red " + i, 24, false);
			animation.addByPrefix("bad-note1-" + i, "note splash electric blue " + i, 24, false);
			animation.addByPrefix("bad-note2-" + i, "note splash electric green " + i, 24, false);
			animation.addByPrefix("bad-note0-" + i, "note splash electric purple " + i, 24, false);
			animation.addByPrefix("bad-note3-" + i, "note splash electric red " + i, 24, false);
			animation.addByPrefix("shit-note1-" + i, "note splash electric blue " + i, 24, false);
			animation.addByPrefix("shit-note2-" + i, "note splash electric green " + i, 24, false);
			animation.addByPrefix("shit-note0-" + i, "note splash electric purple " + i, 24, false);
			animation.addByPrefix("shit-note3-" + i, "note splash electric red " + i, 24, false);
		}
	}

	override function update(elapsed:Float) {
		if(animation.curAnim != null)if(animation.curAnim.finished) kill();

		super.update(elapsed);
	}
}