function onUpdate()
    if getPropertyFromClass('ClientPrefs', 'events') then
    function opponentNoteHit(id,data,type,sus)
        getPropertyFromClass("openfl.Lib", "application.window.x")
        getPropertyFromClass("openfl.Lib", "application.window.y")
        triggerEvent('Screen Shake','0.1, 0.002','0.1, 0.002')
        addEffect4('game', 0.1, 0);
        addEffect4('hud', 0.1, 0);
        addEffect1('hud', 0.01);
        addEffect1('game', 0.01);
        runTimer('chromaticTimer', 0.04, 1);
        health = getProperty('health')
        if getProperty('health') > 0.08 then
            setProperty('health', health- 0.009); --doing fair
        end
        setPropertyFromClass('openfl.Lib', 'application.window.y', getRandomFloat(0, 313))
        setPropertyFromClass('openfl.Lib', 'application.window.x', getRandomFloat(0, 313))
    end
    
    function onTimerCompleted(tag)
        if tag == 'chromaticTimer' then
            die('hud');
            die('game');
            addEffect1('hud', 0.004);
            addEffect1('game');
        end
    end
    end
    end