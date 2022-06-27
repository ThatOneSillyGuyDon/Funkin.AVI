--https://gamebanana.com/tuts/15095 For Window Shit
local SineElap = 0;

function onCreate()
    windowy = getPropertyFromClass("openfl.Lib", "application.window.y")
    windowx = getPropertyFromClass("openfl.Lib", "application.window.x")
end

function onUpdatePost(elapsed)
    SineElap = SineElap + (elapsed * 3)
    if difficulty == 1 then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/60)
        setPropertyFromClass('openfl.Lib', 'application.window.x', 3000*math.cos(SineElap)/10+windowx)
        setPropertyFromClass('openfl.Lib', 'application.window.y', 3000*math.sin(SineElap)/10+windowy)
        setProperty('window.width', windowW + math.sin(currentBeat) * 30)--height
        setProperty('window.height', windowH + math.sin(currentBeat) * 30)--height
    end
    if difficulty == 0 then
        setPropertyFromClass('openfl.Lib', 'application.window.x', 1000*math.cos(SineElap)/10+windowx)
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.sin(SineElap)/10+windowy)
    end
end