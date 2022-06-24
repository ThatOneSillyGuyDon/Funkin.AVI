function onUpdate(elapsed)
    for i=0,3 do
    -- Alpha is 0 (0 being invisible)
    noteTweenAlpha(i+16, i, math.floor(curStep/9999), 0.3)
    noteTweenAlpha(i+16, i, math.floor(curStep/9999), 4-7)
    end
    end
    
    function onUpdate()
         -- obs: 10800 = 3*60*60 (3 hours)
         print ""
    --> 10801
            os.time{year=1931, month=8, day=21, hour=0}
    --> 54000   (obs: 54000 = 10800 + 12*60*60)
    setPropertyFromClass('ClientPrefs', 'middleScroll', true) 
    setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
    end

    function onBeatHit()
        health = getProperty('health')
        if getProperty('health') > 0.2 then
            setProperty('health', health- 0.04)
        end
    end

    function onEndSong()
        setPropertyFromClass('ClientPrefs', 'ghostTapping', true) --:)
        setPropertyFromClass('ClientPrefs', 'middleScroll', false) 
    end

    function onUpdatePost()
        setProperty('healthBar.visible', false)
        setProperty('healthBarBG.visible', false)
        setProperty('scoreTxt.visible', false)
        setProperty('timeBar.visible', false)
        setProperty('timeBarBG.visible', false)
        setProperty('iconP1.visible', false)
        setProperty('timeBarTxt', false)
    end

   function onCreate()
        makeLuaText('warning', 'Press Space For Gain health', 1100, 100)
        setTextSize('warning', 32)
        setTextColor('warning', '0xFFFFFF')
        setTextFont('warning', 'vcr.ttf')
    end
