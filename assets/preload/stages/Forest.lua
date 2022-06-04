function onCreate()
makeLuaSprite('forest', 'funkinAVI/goofy/forest', 0, 0);
setScrollFactor('forest', 1, 1);
setProperty('forest.flipY', false);
setProperty('forest.flipX', false);
addLuaSprite('forest', 'false');
addEffect1('forest', 0.005);
addEffect5('forest', 1, false, true, true);
addEffect5('game');
addEffect1('hud', 0.004);
addEffect5('hud');
addEffect4('hud', 0.5, 0);
addEffect4('game', 0.6, 0);
addEffect10('game');
addEffect11('hud');
end