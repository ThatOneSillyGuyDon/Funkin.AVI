function onCreate()
makeLuaSprite('office', 'funkinAVI/mrSmile/office', 0, 0);
setScrollFactor('office', 1, 1);
setProperty('office.flipY', false);
setProperty('office.flipX', false);
addLuaSprite('office', false);
makeLuaSprite('light', 'funkinAVI/mrSmile/officeLight', 0, 0);
setScrollFactor('light', 1, 1);
setProperty('light.flipY', false);
setProperty('light.flipX', false);
addLuaSprite('light', true);
addEffect1('office', 0.005);
addEffect5('office', 1, false, true, true);
addEffect1('light', 0.005);
addEffect5('light', 1, false, true, true);
addEffect5('game');
addEffect1('hud', 0.004);
addEffect5('hud');
addEffect4('hud', 0.5, 0);
addEffect4('game', 0.6, 0);
addEffect10('game');
addEffect11('hud');
end