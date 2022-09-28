package;

import GameJolt.GameJoltAPI as GameJolt;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.system.FlxSound;
import lime.app.Application;
import flixel.ui.FlxBar;
import haxe.Json;
import flixel.util.FlxCollision;
#if windows
import Discord.DiscordClient;
#end
import openfl.display.BitmapData;
import openfl.utils.Assets;
import haxe.Exception; //funi
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
#if cpp
import sys.FileSystem;
import sys.io.File;
import sys.thread.Thread;
#end

enum PreloadType {
    atlas;
    image;
    imagealt;
    chart; //wat?
    sound;
   // music; <-This shit doesn't work
}

class BetterPreload extends MusicBeatState {

    var globalRescale:Float = 2/3;
    var preloadStart:Bool = false;

    var loadText:FlxText;
    var loadBar:FlxBar;
    var assetStack:Map<String, PreloadType> = [

        //Holy Shit, that's a lot of stage assets
        'funkinAVI/episode1/street/Mickeybg' => PreloadType.image, 
        'funkinAVI/episode1/street/Grainshit' => PreloadType.image, 
        'funkinAVI/episode1/street/scratchShit' => PreloadType.image,
        'funkinAVI/episode1/streetNEW/bg' => PreloadType.image,
        'funkinAVI/episode1/streetNEW/street' => PreloadType.image,
        'funkinAVI/episode1/streetNEW/rain' => PreloadType.image,
        'funkinAVI/episode1/streetNEW/vignetteOverlay' => PreloadType.image,
        'funkinAVI/goofyNEW/ground' => PreloadType.image,
        'funkinAVI/goofyNEW/bg' => PreloadType.image, 
        'funkinAVI/goofyNEW/treesFront' => PreloadType.image, 
        'funkinAVI/goofyNEW/treesBack' => PreloadType.image, 
        'funkinAVI/goofy/forest' => PreloadType.image, 
        'funkinAVI/DontCross/theLine' => PreloadType.image,
        'funkinAVI/mrSmile/office' => PreloadType.image, 
        'funkinAVI/mrSmile/officeLight' => PreloadType.image, 
        'funkinAVI/relapse/relapse1' => PreloadType.image, 
        'funkinAVI/relapse/relapse2' => PreloadType.image, 
        'funkinAVI/rs/white' => PreloadType.image,
        'funkinAVI/SQUAREBOILOL/PixelMouse' => PreloadType.image, 
        'funkinAVI/SQUAREBOILOL/greyParticle' => PreloadType.image, 
        'funkinAVI/SQUAREBOILOL/particleBlack' => PreloadType.image, 
        'funkinAVI/vault/vault' => PreloadType.image, 
        'funkinAVI/vault/vaultWhite' => PreloadType.image, 
        'funkinAVI/vault/chains' => PreloadType.image, 
        'funkinAVI/vault/cahinsWhite' => PreloadType.image, 
        'funkinAVI/vault/holyshitdarkness' => PreloadType.image, 
        'funkinAVI/vault/holyshititstoobright' => PreloadType.image, 
        'funkinAVI/walt/walt-bg' => PreloadType.image, 

        //Preload UI stuff
        'funkinAVI/uiAndEvents/fuckYouSmiles' => PreloadType.image,
        'funkinAVI/uiAndEvents/lives-icon' => PreloadType.image,
        'funkinAVI/uiAndEvents/ohNoes' => PreloadType.image,
        'funkinAVI/uiAndEvents/spotlight' => PreloadType.image,
        'hudAssets/demolition/health-icon' => PreloadType.image,
        'hudAssets/demolition/health-iconGREYSCALE' => PreloadType.image,
        'hudAssets/demolition/miss-icon' => PreloadType.image,
        'hudAssets/demolition/miss-iconGREYSCALE' => PreloadType.image,
        'hudAssets/demolition/judge-underlay' => PreloadType.image,
        'funkinAVI-filters/noise' => PreloadType.image,
        'funkinAVI-filters/Grainshit' => PreloadType.imagealt,
        'funkinAVI-filters/scratchShit' => PreloadType.imagealt,
        'lurkingShadow' => PreloadType.imagealt,
        'healthBar' => PreloadType.image,
        'healthBar-Long' => PreloadType.image,
        'timeBar' => PreloadType.image,

        //Note Skins and Splashes
        'NOTE_assets' => PreloadType.image,
        'Skins/bloodyNOTE_assets' => PreloadType.image,
        'Skins/gfNOTE_assets' => PreloadType.image,
        'Skins/GreyNOTE_assets' => PreloadType.image,
        'Skins/DADNOTE_assets' => PreloadType.image,
        'Skins/demolitiondon96NOTE_assets' => PreloadType.image,
        'Skins/fakeNOTE_assets' => PreloadType.image,
        'Skins/pixelBF-notes' => PreloadType.image,
        'Skins/TopTier69NOTE_assets' => PreloadType.image,
        'Skins/WaltNOTES' => PreloadType.image,
        'NoteSplashSkins/GREYnoteSplashes' => PreloadType.image,
        'NoteSplashSkins/noteSplashes' => PreloadType.image,
        'NoteSplashSkins/noteSplashesGREY' => PreloadType.image,
        'NoteSplashSkins/noteSplashesPixel' => PreloadType.image,
        'NoteSplashSkins/waltSplashes' => PreloadType.image,

        //Icons cause why not?
        'icons/icon-fake' => PreloadType.imagealt,
        'icons/icon-fakenew' => PreloadType.imagealt,
        'icons/icon-bf' => PreloadType.imagealt,
        'icons/icon-bfgrey' => PreloadType.imagealt,
        'icons/icon-bfgrey-pixel' => PreloadType.imagealt,
        'icons/icon-bf-ohgod' => PreloadType.imagealt,
        'icons/icon-bf-old' => PreloadType.imagealt,
        'icons/icon-bf-pixel' => PreloadType.imagealt,
        'icons/icon-bf-relapse-pixel' => PreloadType.imagealt,
        'icons/icon-dad' => PreloadType.imagealt,
        'icons/icon-demon' => PreloadType.imagealt,
        'icons/icon-face' => PreloadType.imagealt,
        'icons/icon-gf' => PreloadType.imagealt,
        'icons/icon-goofy' => PreloadType.imagealt,
        'icons/icon-insanemick' => PreloadType.imagealt,
        'icons/icon-legacy' => PreloadType.imagealt,
        'icons/icon-lunamick' => PreloadType.imagealt,
        'icons/icon-mickey' => PreloadType.imagealt,
        'icons/icon-mysterymouse' => PreloadType.imagealt,
        'icons/icon-ohgod' => PreloadType.imagealt,
        'icons/icon-pnm' => PreloadType.imagealt,
        'icons/icon-relapse2-pixel' => PreloadType.imagealt,
        'icons/icon-relapse-pixel' => PreloadType.imagealt,
        'icons/icon-rs' => PreloadType.imagealt,
        'icons/icon-smile' => PreloadType.imagealt,
        'icons/icon-smilehidden' => PreloadType.imagealt,
        'icons/icon-square-pixel' => PreloadType.imagealt,
        'icons/icon-walt' => PreloadType.imagealt,
        'icons/icon-whitenew' => PreloadType.imagealt,

        //Preload countdown assets for better loading time
        'funkinAVI/intro/3' => PreloadType.image, 
        'funkinAVI/intro/2' => PreloadType.image, 
        'funkinAVI/intro/1' => PreloadType.image, 
        'funkinAVI/intro/Go' => PreloadType.image, 
        'funkinAVI/intro/3-PixelWorld-pixel' => PreloadType.image, 
        'funkinAVI/intro/2-PixelWorld-pixel' => PreloadType.image, 
        'funkinAVI/intro/1-PixelWorld-pixel' => PreloadType.image, 
        'funkinAVI/intro/Go-PixelWorld-pixel' => PreloadType.image, 

        //Preload the entire character roster (Sorry, this doesn't mean no more lag spikes when hardcoded, but it does work if the character change events are in the chart editor)
        'bfDemon' => PreloadType.atlas,
        'bfGrey' => PreloadType.atlas,
       'bfPixel' => PreloadType.atlas,
        'bfPixelsDEAD' => PreloadType.atlas,
        'Bf-relapsed' => PreloadType.atlas,
        'blackness' => PreloadType.atlas,
        'blessBf' => PreloadType.atlas,
        'BOYFRIEND' => PreloadType.atlas,
        'BOYFRIEND_DEAD' => PreloadType.atlas,
        'FavibBf' => PreloadType.atlas,
        'HunterGoofy' => PreloadType.atlas,
        'Mickey1' => PreloadType.atlas,
        'Mickey1NEW' => PreloadType.atlas,
        'Mickey2NEW' => PreloadType.atlas,
        'Mickeycross' => PreloadType.atlas,
        'mickeyIsolateDrop' => PreloadType.atlas,
        'Mickeyphase2' => PreloadType.atlas,
        'Mickeyphase1' => PreloadType.atlas,
        'Mickey3' => PreloadType.atlas,
        'Mickeystoppedworking' => PreloadType.atlas,
        'mrsmiles' => PreloadType.atlas,
        'Relapsed1' => PreloadType.atlas,
        'Relapsed2' => PreloadType.atlas,
        'rs' => PreloadType.atlas,
        'walter' => PreloadType.atlas,
        'Waltfnf' => PreloadType.atlas,
        'WHITE_NOISE' => PreloadType.atlas,
        'GF_assets' => PreloadType.atlas,
        'DADDY_DEAREST' => PreloadType.atlas,

        //Menu stuff
        'Title_bg' => PreloadType.imagealt,
        'MickeyLogo' => PreloadType.imagealt,
        'NEWmenu/HahaSadBoi' => PreloadType.imagealt,
        'NEWmenu/newspaper' => PreloadType.imagealt,
        'storyMenuTransition' => PreloadType.imagealt,
        'menuFreeplay' => PreloadType.imagealt,
        'menuDesat' => PreloadType.imagealt,
        'menuBGBlue' => PreloadType.imagealt,
        'menuBGMagenta' => PreloadType.imagealt,
        'Menu_Tracks' => PreloadType.imagealt,
        'achievements/lockedAchievement' => PreloadType.imagealt,
        'achievements/episode1' => PreloadType.imagealt,
        'achievements/episode1_nomiss' => PreloadType.imagealt,
        'achievements/episode1_SFC' => PreloadType.imagealt,
        'achievements/episode1_suicide' => PreloadType.imagealt,
        'achievements/episode2' => PreloadType.imagealt,
        'achievements/episode2_nomiss' => PreloadType.imagealt,
        'achievements/episode2_SFC' => PreloadType.imagealt,
        'achievements/episode2_suicide' => PreloadType.imagealt,
        'achievements/malfunction_nomiss' => PreloadType.imagealt,
        'achievements/malfunction' => PreloadType.imagealt,
        'achievements/malfunction_tryhard' => PreloadType.imagealt,
        'achievements/relapse_nomiss' => PreloadType.imagealt,
        'achievements/gamejolt' => PreloadType.imagealt,
        'achievements/lockedachievement' => PreloadType.imagealt,
        'WARNING/Avi_Disclaimer' => PreloadType.imagealt,
        'funkinAVI/WARNING/Avi_Disclaimer' => PreloadType.image,
        'alphabet' => PreloadType.imagealt,
        'checkboxanim' => PreloadType.imagealt,

        'isolated' => PreloadType.chart,
        'isolated-old' => PreloadType.chart,
        'isolated-beta' => PreloadType.chart,
        'lunacy' => PreloadType.chart,
        'delusional' => PreloadType.chart,
        'bless' => PreloadType.chart,
        'mercy' => PreloadType.chart,
        'malfunction' => PreloadType.chart,
        'hunted' => PreloadType.chart,
        'neglection' => PreloadType.chart,
        "don't-cross!" => PreloadType.chart,
        'twisted-grins' => PreloadType.chart,
        'facade' => PreloadType.chart,
        'mortiferum-risus' => PreloadType.chart,
        'cycled-sins' => PreloadType.chart,
        'scrapped' => PreloadType.chart,
        'war-dilemma' => PreloadType.chart,



    ];
    var maxCount:Int;

    public static var preloadedAssets:Map<String, FlxGraphic>;
    //var backgroundGroup:FlxTypedGroup<FlxSprite>;
    var bg:FlxSprite;

    override public function create() {
        super.create();

        FlxTransitionableState.skipNextTransIn = true;
        FlxTransitionableState.skipNextTransOut = true;

        FlxG.camera.alpha = 0;

        maxCount = Lambda.count(assetStack);
        trace(maxCount);
        // create funny assets
       // backgroundGroup = new FlxTypedGroup<FlxSprite>();
        FlxG.mouse.visible = false;

        preloadedAssets = new Map<String, FlxGraphic>();

        var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('funkay')); //Placeholder
		menuBG.screenCenter();
		add(menuBG);
        /*var unownBg:FlxSprite = new FlxSprite();
		unownBg.loadGraphic(Paths.image('Loading Unown'));
        unownBg.setGraphicSize(Std.int(unownBg.width * globalRescale));
        unownBg.updateHitbox();
		backgroundGroup.add(unownBg);

        bg = new FlxSprite();
		bg.loadGraphic(Paths.image('Loading Hypno'));
        bg.setGraphicSize(Std.int(bg.width * globalRescale));
        bg.updateHitbox();
		backgroundGroup.add(bg);

        var gfBg:FlxSprite = new FlxSprite();
		gfBg.loadGraphic(Paths.image('Loading GF'));
        gfBg.setGraphicSize(Std.int(gfBg.width * globalRescale));
        gfBg.updateHitbox();
		backgroundGroup.add(gfBg);

        var pendulum:FlxSprite = new FlxSprite();
        pendulum.frames = Paths.getSparrowAtlas('Loading Screen Pendelum');
        pendulum.animation.addByPrefix('load', 'Loading Pendelum Finished', 24, true);
        pendulum.animation.play('load');
        pendulum.setGraphicSize(Std.int(pendulum.width * globalRescale));
        pendulum.updateHitbox();
        backgroundGroup.add(pendulum);
        pendulum.x = FlxG.width - (pendulum.width + 10);
        pendulum.y = FlxG.height - (pendulum.height + 10);*/

       // add(backgroundGroup);
        FlxTween.tween(FlxG.camera, {alpha: 1}, 0.5, {
            onComplete: function(tween:FlxTween){
                Thread.create(function(){
                    assetGenerate();
                });
            }
        });

        // save bullshit
        FlxG.save.bind('funkin', 'ninjamuffin99');
        if(FlxG.save.data.episode1FPLock == null) FPClientPrefs.lockinIt();

        GameJolt.connect();
        GameJolt.authDaUser(FlxG.save.data.gjUser, FlxG.save.data.gjToken); //Loads GameJolt stuff

        loadText = new FlxText(-100, FlxG.height - (32 + 7), 0, 'Loading...', 32);
        loadText.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(loadText);
        loadText.alpha = 0;

        loadBar = new FlxBar(0, 730, LEFT_TO_RIGHT, 1280, 20, this,
        'storedPercentage', 0, 1);
        loadBar.alpha = 0;
        loadBar.createFilledBar(0xFF2E2E2E, FlxColor.WHITE);
        add(loadBar);

        FlxTween.tween(loadText, {alpha: 1, x: 5}, 0.5, {startDelay: 0.5});
        FlxTween.tween(loadBar, {alpha: 1, y: 700}, 0.5, {startDelay: 0.5});
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
    }

    var storedPercentage:Float = 0;

    function assetGenerate() {
        //
        var countUp:Int = 0;
        for (i in assetStack.keys()) {
            trace('calling asset $i');

            FlxGraphic.defaultPersist = true;
            switch(assetStack[i]) {
                case PreloadType.imagealt:
                    var menuShit:FlxGraphic = FlxG.bitmap.add(Paths.image(i));
                    preloadedAssets.set(i, menuShit);
                    trace('menu asset is loaded');
                case PreloadType.image:
                    var savedGraphic:FlxGraphic = FlxG.bitmap.add(Paths.image(i, 'shared'));
                    preloadedAssets.set(i, savedGraphic);
                    trace(savedGraphic + ', yeah its working');
                case PreloadType.atlas:
                    var preloadedCharacter:Character = new Character(FlxG.width / 2, FlxG.height / 2, i);
                    preloadedCharacter.visible = false;
                    add(preloadedCharacter);
                    trace('character loaded ${preloadedCharacter.frames}');
                case PreloadType.chart:
                    var preloadedChart:String = Paths.json(i);
                    trace(i + 'is loaded?');
                        var preloadedSong:String = Paths.voices(i);
                        trace(i + 'loaded vocals');
                        var preloadedSong2:String = Paths.inst(i);
                        trace(i + 'loaded music');
                /*case PreloadType.music:
                    var preloadedSong:Song = new Song();
                    add(preloadedSong);
                    trace('song successfully loaded');*/
            }
            FlxGraphic.defaultPersist = false;
        
            countUp++;
            storedPercentage = countUp/maxCount;
            loadText.text = 'Loading... Progress at ${Math.floor(storedPercentage * 100)}%';
        }

        ///*
        FlxTween.tween(FlxG.camera, {alpha: 0}, 0.5, {
            onComplete: function(tween:FlxTween){
                if(FlxG.save.data.funiShaders == null && !ShadersState.leftState)
                    {
                        MusicBeatState.switchState(new ShadersState());
                    }else{
                if(ClientPrefs.language == "Spanish") {
                    MusicBeatState.switchState(new SpanishTitleState());
                } else {
                MusicBeatState.switchState(new TitleState());
            }
        }
            }
        });
        //*/

    }
}