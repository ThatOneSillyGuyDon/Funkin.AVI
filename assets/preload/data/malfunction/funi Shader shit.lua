function onUpdate()
    if getPropertyFromClass('ClientPrefs', 'events') then
    function opponentNoteHit(id,data,type,sus)
        triggerEvent('Screen Shake','0.1, 0.002','0.1, 0.002')
        addEffect4('game', 5, 0);
        addEffect4('hud', 2, 0);
        addEffect1('hud', 0.01);
        addEffect1('game', 0.01);
        runTimer('chromaticTimer', 0.04, 1);
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
