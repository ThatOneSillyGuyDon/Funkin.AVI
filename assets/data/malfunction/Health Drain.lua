function opponentNoteHit(id,data,type,sus)
    triggerEvent('Screen Shake','0.1, 0.002','0.1, 0.002')
    addTiltshiftEffect('game', 5, 0);
    addTiltshiftEffect('hud', 2, 0);
    addChromaticAbberationEffect('hud', 0.01);
    addChromaticAbberationEffect('game', 0.01);
    runTimer('chromaticTimer', 0.04, 1);
	health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.025);
	end
end

function onTimerCompleted(tag)
    if tag == 'chromaticTimer' then
	    clearEffects('hud');
	    clearEffects('game');
	    addScanlineEffect('hud');
	    addChromaticAbberationEffect('hud', 0.004);
	    addVCREffect('hud');
	    addChromaticAbberationEffect('game');
	end
end