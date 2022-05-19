function onCreate()
makeLuaSprite('office', 'funkinAVI/goofy/forest', 0, 0);
setScrollFactor('office', 1, 1);
setProperty('office.flipY', false);
setProperty('office.flipX', false);
addLuaSprite('office', false);
addEffect1('office', 0.005);
addEffect5('office', 1, false, true, true);
addEffect5('game');
addEffect1('hud', 0.004);
addEffect5('hud');
addEffect4('hud', 0.5, 0);
addEffect4('game', 0.6, 0);
addEffect10('game');
addEffect11('hud');
end