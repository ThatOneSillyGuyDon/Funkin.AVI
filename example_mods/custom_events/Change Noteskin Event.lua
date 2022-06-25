function onEvent(name, value1, value2)

	if name == 'Change Noteskin Event' then
	pref = (value1)
	pref2 = (value2)
        if value1 == '' then
            pref = 'NOTE_assets'
        end
            if value2 == '' then
                pref2 = 'NOTE_assets'
            end

		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', pref2)
			setPropertyFromGroup('playerStrums', i, 'texture', pref)
		end
		for i = 0, getProperty('unspawnNotes.length')-0 do
			if not getPropertyFromGroup('notes', i, 'mustPress') then
				setPropertyFromGroup('notes', i, 'texture', pref); 
		end 
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'texture', pref); 
			end 
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'texture', pref2); 
            end
		end 
	end
end