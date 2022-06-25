function onCreate()
    if difficulty == 1 then
    setProperty('scoreTxt.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeTxt.visible', false)
    end

    if difficulty == 1 and botPlay then
    setProperty('camHUD.visible', false)
    end

        makeLuaText('warning', ''..songName..' - Suicidal', 1090, 100)
        addLuaText('warning', 'Press Dark Notes For Gain health')
        setTextSize('warning', 32)
        setTextColor('warning', '0xFFFFFF')
        setTextFont('warning', 'vcr.ttf')
end