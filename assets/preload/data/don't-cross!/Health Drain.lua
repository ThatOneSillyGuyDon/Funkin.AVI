function opponentNoteHit(id,data,type,sus)
	health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.01);
	end
end