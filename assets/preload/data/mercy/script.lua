function onUpdate(elapsed)
    for i=0,3 do
    -- Alpha is 0 (0 being invisible)
    noteTweenAlpha(i+16, i, math.floor(curStep/9999), 0.3)
    noteTweenAlpha(i+16, i, math.floor(curStep/9999), 4-7)
    end
    end
    
    function onUpdate()
    setPropertyFromClass('ClientPrefs', 'middleScroll', true) 
    setPropertyFromClass('ClientPrefs', 'ghostTapping', false)

    if not botPlay and keyJustPressed('space') then
        health = getProperty('health')
        if getProperty('health') then
            setProperty('health', health+ 0.03) 
        end
    end
      end

    function onBeatHit()
        if not botPlay then
        health = getProperty('health')
        if getProperty('health') > 0.2 then
            setProperty('health', health- 0.04)
        end
    end
end

    function goodNoteHit()
        health = getProperty('health')
              if getProperty('health') then
                  setProperty('health', health+ 0.01)
              end
            end 

    function onUpdatePost()
        if not botPlay then
        setProperty('healthBar.visible', false)
        setProperty('healthBarBG.visible', false)
        setProperty('scoreTxt.visible', false)
        setProperty('timeBar.visible', false)
        setProperty('timeBarBG.visible', false)
        setProperty('iconP1.visible', false)
        setProperty('timeTxt.visible', false);
    end
end

   function onCreate()
    if not botPlay then
        makeLuaText('warning', "Press 'Space' For Gain health", 1100, 100)
        addLuaText('warning', 'Press Dark Notes For Gain health')
        setTextSize('warning', 32)
        setTextColor('warning', '0xFFFFFF')
        setTextFont('warning', 'vcr.ttf')
        --NGL i finally know how to make custom text without a tutorial

    end
end