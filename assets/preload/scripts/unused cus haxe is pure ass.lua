function onStartCountdown()
	if buildTarget == 'browser' then
		makeLuaSprite('noWebsite', 'Piracy', 0, 0) --image should be 1280 x 720
		setObjectCamera('noWebsite', 'camHUD')
		addLuaSprite('noWebsite', true)
		return Function_Stop
	end
	return Function_Continue
end

--i hate haxe now