function onCreate()
    --precache
    --dad
    addCharacterToList('mickeysadistic', 'dad');
end

--scripts part because idk where it founds in source 
if curStep == 1279 then
function onUpdatePost() 
    setProperty('timeTxt.visible', false);
    setProperty('scoreTxt.visible', false);
    setProperty('timeBar.visible', false);
    setProperty('timeBarBG.visible', false);
    setProperty('healthBar.visible', false);
    setProperty('healthBarBG.visible', false);

    health = getProperty('health')
    if getProperty('health') then
        setProperty('health', health- 0.01);
    end
end
    end

    if curStep == 1304 then
        health = getProperty('health')
        if getProperty('health') then
            setProperty('health', health+ 0.02);
        end
    end