package;

//I'm fucking lazy, pls don't kill me ourple guy team :(

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
import flixel.tweens.FlxTween;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import openfl.filters.ShaderFilter;
import WeekData;
import Shaders;
import flixel.addons.display.FlxTiledSprite;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.system.FlxAssets;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

class FPClientPrefs
{
    public static var episode1FPLock:String = 'locked';
    public static var episode2FPLock:String = 'locked';

    public static var huntedLock:String = 'locked';
    public static var oldisolateLock:String = 'locked';
    public static var malfunctionLock:String = 'locked';
    public static var revengeLock:String = 'locked';
    public static var blessLock:String = 'locked';
    public static var sinsLock:String = 'locked';
    public static var warLock:String = 'locked';
    public static var crossinLock:String = 'locked';
    public static var mercyLock:String = 'locked';

    public static function lockinIt() {
        if (FlxG.save.data.episode1FPLock == null) FlxG.save.data.episode1FPLock = 'locked';
        if (FlxG.save.data.episode2FPLock == null) FlxG.save.data.episode2FPLock = 'locked';

        if (FlxG.save.data.huntedLock == null) FlxG.save.data.huntedLock = 'locked';
        if (FlxG.save.data.oldisolateLock == null) FlxG.save.data.oldisolateLock = 'locked';
        if (FlxG.save.data.malfunctionLock == null) FlxG.save.data.malfunctionLock = 'locked';
        if (FlxG.save.data.revengeLock == null) FlxG.save.data.revengeLock = 'locked';
        if (FlxG.save.data.blessLock == null) FlxG.save.data.blessLock = 'locked';
        if (FlxG.save.data.sinsLock == null) FlxG.save.data.sinsLock = 'locked';
        if (FlxG.save.data.warLock == null) FlxG.save.data.warLock = 'locked';
        if (FlxG.save.data.crossinLock == null) FlxG.save.data.crossinLock = 'locked';
        if (FlxG.save.data.mercyLock == null) FlxG.save.data.mercyLock = 'locked';
        FlxG.save.flush();
    }

    public static function saveShit() {
        FlxG.save.data.episode1FPLock = episode1FPLock;
        FlxG.save.data.episode2FPLock = episode2FPLock;

        FlxG.save.data.huntedLock = huntedLock;
        FlxG.save.data.oldisolateLock = oldisolateLock;
        FlxG.save.data.malfunctionLock = malfunctionLock;
        FlxG.save.data.revengeLock = revengeLock;
        FlxG.save.data.blessLock = blessLock;
        FlxG.save.data.sinsLock = sinsLock;
        FlxG.save.data.warLock = warLock;
        FlxG.save.data.crossinLock = crossinLock;
        FlxG.save.data.mercyLock = mercyLock;
        FlxG.save.flush();
    }

    public static function loadShit() {
        episode1FPLock = FlxG.save.data.episode1FPLock;
        episode2FPLock = FlxG.save.data.episode2FPLock;

        huntedLock = FlxG.save.data.huntedLock;
        oldisolateLock = FlxG.save.data.oldisolateLock;
        malfunctionLock = FlxG.save.data.malfunctionLock;
        revengeLock = FlxG.save.data.revengeLock;
        blessLock = FlxG.save.data.blessLock;
        sinsLock = FlxG.save.data.sinsLock;
        warLock = FlxG.save.data.warLock;
        crossinLock = FlxG.save.data.crossinLock;
        mercyLock = FlxG.save.data.mercyLock;
        FlxG.save.flush();
    }
}