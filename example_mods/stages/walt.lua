function onCreate()
	makeLuaSprite('light', 'light', -344, -160);
	scaleObject('light', 1.7, 1.7);
	setScrollFactor('light', 1, 1);
	setProperty('light.antialiasing', false);
	setObjectOrder('light', 0);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 1);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 2);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 3);

	close(true);
end