--https://gamebanana.com/tuts/15095 For Window Shit
local WindowDanceX = false;
local WindowDanceY = false;
local WindowDanceXY = false;
local WindowRandom = false;
local SineElap = 0;

function onCreate()
    windowy = getPropertyFromClass("openfl.Lib", "application.window.y")
    windowx = getPropertyFromClass("openfl.Lib", "application.window.x")
end

function onStepHit()
    if curStep >= 32 and curStep <= 95 then
        WindowDanceX = true
    end
    if curStep == 95 + 1 then
        WindowDanceX = false
    end
    if curStep >= 96 and curStep <= 159 then
        WindowDanceY = true
    end
    if curStep == 159 + 1 then
        WindowDanceY = false
    end
end

function onUpdatePost(elapsed)
    SineElap = SineElap + (elapsed * 3)
    if WindowDanceX == true then
        setPropertyFromClass('openfl.Lib', 'application.window.x', 1000*math.cos(SineElap)/10+windowx)
    end
    if WindowDanceY == true then
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.sin(SineElap)/10+windowy)
    end
    if WindowDanceXY == true then
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.cos(SineElap)/10+windowx)
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.sin(SineElap)/10+windowy)
    end
end