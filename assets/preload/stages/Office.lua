function onCreate()
makeLuaSprite('Office', 'funkinAVI/mrSmile/office', 0, 0);
makeLuaSprite('Light', 'funkinAVI/mrSmile/officeLight', 0, 0);
setScrollFactor('Office', 1, 1);
setScrollFactor('Light', 1, 1);
setProperty('Office.flipY', false);
setProperty('Light.flipY', false);
setProperty('Office.flipX', false);
setProperty('Light.flipX', false);
addLuaSprite('Office', false);
addLuaSprite('Light', true);
addEffect1('Office', 0.005);
addEffect5('Office', 1, false, true, true);
addEffect1('Light', 0.005);
addEffect5('Light', 1, false, true, true);
addEffect5('game');
addEffect1('hud', 0.004);
addEffect5('hud');
addEffect4('hud', 0.5, 0);
addEffect4('game', 0.6, 0);
addEffect10('game');
addEffect11('hud');
end